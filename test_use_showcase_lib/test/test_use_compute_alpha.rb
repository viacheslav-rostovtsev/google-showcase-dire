require 'securerandom'
require "test_helper"

require "google/cloud/compute/v1/addresses"
require "google/cloud/compute/v1/region_operations"

class TestUseComputeAlpha < Minitest::Test

  # POST https://www.googleapis.com/compute/v1/projects/client-debugging/regions/us-central1/addresses
  # {
  #   "name": "NAME",
  #   "networkTier": "PREMIUM",
  #   "region": "projects/client-debugging/regions/us-central1"
  # }

  def test_create_delete_ip_real
    rest_options = {}
    ::Google::Cloud::Compute::V1::Addresses::Rest::Client.configure do |config|
      config.timeout = 10.0
    end

    client = ::Google::Cloud::Compute::V1::Addresses::Rest::Client.new

    project = "client-debugging"
    region = "us-central1"
    address_name = "testaddr-#{SecureRandom.uuid}"

    # result = client_ops.get operation: "foo", project: project, region: region do |res, env|
    #   p res
    #   p env
    # end

    address_resource = {
      name: address_name,
      region: region,
      network_tier: ::Google::Cloud::Compute::V1::Address::NetworkTier::PREMIUM,
    }

    result = client.insert(address_resource: address_resource, project: project, region: region, request_id: nil)
    assert_kind_of ::Google::Cloud::Compute::V1::Operation, result

    puts "Operation to create: #{result.name} status #{result.status}"

    # option (google.api.oauth_scopes) =
    #   "https://www.googleapis.com/auth/compute.readonly,"
    # "https://www.googleapis.com/auth/compute,"
    # "https://www.googleapis.com/auth/cloud-platform";

    if result.status != :DONE
      client_ops ||= ::Google::Cloud::Compute::V1::RegionOperations::Rest::Client.new
      while result.status != :DONE
        puts "Checking for create operation status ... "
        result = client_ops.get operation: result.name, project: project, region: region
        assert_kind_of ::Google::Cloud::Compute::V1::Operation, result
        puts "Status:  #{result.status}"
        sleep 1
      end
    end

    #list_result = client.list(filter: nil, max_results: 2, order_by: nil, page_token: nil, project: project, region: region, return_partial_success: nil)

    result = client.delete address: address_name, project: project, region: region, request_id: nil
    assert_kind_of ::Google::Cloud::Compute::V1::Operation, result
    puts "Operation to delete: #{result.name} status #{result.status}"

    if result.status != :DONE
      client_ops ||= ::Google::Cloud::Compute::V1::RegionOperations::Rest::Client.new
      while result.status != :DONE
        puts "Checking for delete operation status ... "
        result = client_ops.get operation: result.name, project: project, region: region
        assert_kind_of ::Google::Cloud::Compute::V1::Operation, result
        puts "Status:  #{result.status}"
        sleep 1
      end
    end
  end

  def test_api_error_404
    project = "client-debugging"
    region = "us-central1"

    client = ::Google::Cloud::Compute::V1::Addresses::Rest::Client.new

    exception = assert_raises Google::Cloud::NotFoundError do
      client.get(address: 'nonexists1123512345', project: project, region: region)
    end

    assert_match /The resource '[^']+' was not found/, exception.message
  end

  def test_client_error_no_prj
    region = "us-central1"
    client = ::Google::Cloud::Compute::V1::Addresses::Rest::Client.new
    exception = assert_raises Google::Cloud::InvalidArgumentError do
      client.get(address: 'nonexists1123512345', region: region)
    end
    assert exception.message.include?('An error has occurred when making a REST request: Invalid resource field value in the request.')
  end

end
