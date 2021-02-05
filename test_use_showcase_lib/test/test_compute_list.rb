require "test_helper"
require "google/cloud/compute/v1/zones"

$default_zone = 'us-central1-a'
$default_project = 'client-debugging'

class TestUseComputePagination < Minitest::Test

  def setup
    @client = Google::Cloud::Compute::V1::Zones::Rest::Client.new
  end

  def test_max_results
    zones = @client.list project: $default_project
    print zones.items.length

    zones_2 = @client.list project: $default_project, max_results: 3
    print zones_2.items.length
    assert_equal 3, zones_2.items.length
  end
end
