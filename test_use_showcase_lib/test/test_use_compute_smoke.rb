require 'securerandom'
require "test_helper"

require "google/cloud/compute/v1/instances"
require "google/cloud/compute/v1/zone_operations"

$default_zone = 'us-central1-a'
$default_project = "client-debugging"
$machine_type = 'zones/'+$default_zone+'/machineTypes/n1-standard-1'
$image =  'https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-7-wheezy-v20150710'


class TestUseComputeSmoke < Minitest::Test

  def setup
    @client = ::Google::Cloud::Compute::V1::Instances::Rest::Client.new
    @name = 'rbgapic' + rand(max=10000000).to_s
    @instances = []
    if $default_project.eql? NIL
      skip("PROJECT_ID must be set before running this test")
    end
  end

  def teardown
    @instances.each do |instance|
      @client.delete(project: $default_project, zone: $default_zone, instance: instance)
    end
  end

  def test_create_instance
    self.insert_resource
    instance = self.get_instance
    assert_equal(@name, instance.name)
    assert_equal(1, (instance.disks).length)
    assert instance.machine_type.include?($machine_type)
  end

  def get_instance
    @client.get(project: $default_project, zone: $default_zone, instance: @name)
  end

  def insert_resource
    instance_resource = {
      name: @name,
      machine_type: $machine_type,
      network_interfaces: [{access_configs: [{name: 'default'}]}],
      disks: [{initialize_params: {source_image: $image}, boot: true, auto_delete: true, type: 'PERSISTENT'}],
    }
    result = @client.insert(project: $default_project, zone: $default_zone, instance_resource: instance_resource)
    @instances.append(@name)
    if result.status != :DONE
      client_ops ||= ::Google::Cloud::Compute::V1::ZoneOperations::Rest::Client.new
      while result.status != :DONE
        result = client_ops.get(operation: result.name, project: $default_project, zone: $default_zone)
        sleep 3
      end
    end
    end

  def test_aggregated_list
    self.insert_resource
    result = @client.aggregated_list(project: $default_project)['items']['zones/'+$default_zone]['instances']
    names = result.map{|x| x['name']}
    assert names.include? @name
  end


  def test_api_error_404
    exception = assert_raises Google::Cloud::NotFoundError do
      @client.get(instance: 'nonexists1123512345', zone: $default_zone, project: $default_project)
    end

    assert_match /The resource '[^']+' was not found/, exception.message
  end

  def test_client_error_no_prj
    exception = assert_raises Google::Cloud::InvalidArgumentError do
      @client.get(instance: 'nonexists1123512345', zone: $default_zone)
    end
    assert exception.message.include?('An error has occurred when making a REST request: Invalid resource field value in the request.')
  end
end
