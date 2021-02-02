require 'securerandom'
require "test_helper"

require "google/cloud/compute/v1/zones"
require "google/cloud/compute/v1/regions"

$default_zone = 'us-central1-a'
$default_project = ENV['PROJECT_ID']

class TestUseComputePagination < Minitest::Test

  def setup
    @client = Google::Cloud::Compute::V1::Zones::Rest::Client.new
    if $default_project.eql? NIL
      skip("PROJECT_ID must be set before running this test")
    end
  end

  def test_basic_list
    result = @client.list(project: $default_project)['items']
    s = result.map{|x| x['name']}
    assert s.include? $default_zone
  end

  # feature not finished yet
  #def test_max_results
  #  s = @client.list(project: $default_project, max_results: 1)
  #  a = s['items']
  #  assert_equal(1, a.length)
  #end

  # requires working max_results
  #def test_next_page_token
  #
  #end

end
