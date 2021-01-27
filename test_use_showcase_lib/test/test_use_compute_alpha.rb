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
    client = ::Google::Cloud::Compute::V1::Addresses::Rest::Client.new
    client_ops = ::Google::Cloud::Compute::V1::RegionOperations::Rest::Client.new

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
      client_ops = ::Google::Cloud::Compute::V1::RegionOperations::Rest::Client.new
      while result.status != :DONE
        puts "Checking for create operation status ... "
        result = client_ops.get operation: result.name, project: project, region: region
        assert_kind_of ::Google::Cloud::Compute::V1::Operation, result
        puts "Status:  #{result.status}"
        sleep 1
      end
    end

    result = client.delete address: address_name, project: project, region: region, request_id: nil
    assert_kind_of ::Google::Cloud::Compute::V1::Operation, result
    puts "Operation to delete: #{result.name} status #{result.status}"

    if result.status != :DONE
      client_ops = ::Google::Cloud::Compute::V1::RegionOperations::Rest::Client.new
      while result.status != :DONE
        puts "Checking for create operation status ... "
        result = client_ops.get operation: result.name, project: project, region: region
        assert_kind_of ::Google::Cloud::Compute::V1::Operation, result
        puts "Status:  #{result.status}"
        sleep 1
      end
    end
  end
end
