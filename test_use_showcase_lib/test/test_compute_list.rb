require "test_helper"
require "google/cloud/compute/v1/zones"

$default_zone = 'us-central1-a'
$default_project = 'client-debugging'

class TestUseComputePagination < Minitest::Test

  def setup
    @client = Google::Cloud::Compute::V1::Zones::Rest::Client.new
  end

  def test_max_results
    print(@client.list(project: $default_project))
  end
end
