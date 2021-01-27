require "test_helper"
require "google/showcase/v1beta1/identity"
require "google/showcase/v1beta1/echo"
require 'faraday'
require 'json'

class TestUseShowcaseLibTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TestUseShowcaseLib::VERSION
  end

  # @param id [Int, String]
  # @return [Hash {String => String}]
  def create_user_hash(id)
    {
      'display_name' => "ExampleName#{id}",
      'email' => "ExampleName#{id}@example.com"
    }
  end

  def test_echo_real
    rest_options = {}
    client = ::Google::Showcase::V1beta1::Echo::Rest::Client.new
    result = client.echo(content: "foo", error: nil)
    assert_equal "foo", result.content
  end

  def test_create_user_real
    rest_options = {}
    client = ::Google::Showcase::V1beta1::Identity::Rest::Client.new

    user = create_user_hash 0
    # Use hash object
    res = client.create_user({ user: user }) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end
    assert_kind_of ::Google::Showcase::V1beta1::User, res

    user = create_user_hash 1
    # Use named arguments
    client.create_user user: user do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end

    user = create_user_hash 2
    # Use protobuf object
    client.create_user ::Google::Showcase::V1beta1::CreateUserRequest.new(user: user) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end

    user = create_user_hash 3
    # Use hash object with options
    client.create_user({ user: user }, rest_options) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end

    user = create_user_hash 4
    # Use protobuf object with options
    #noinspection RubyYardParamTypeMatch
    client.create_user ::Google::Showcase::V1beta1::CreateUserRequest.new(user: user), rest_options do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end
  end

  # @param id [Int, String]
  # @return [String]
  def create_username id
    "users/#{id}"
  end

  def test_get_user_real
    rest_options = {}
    client = ::Google::Showcase::V1beta1::Identity::Rest::Client.new

    name = create_username 0
    user = create_user_hash 0
    # Use hash object
    client.get_user({ name: name }) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end

    name = create_username 1
    user = create_user_hash 1
    # Use named arguments
    client.get_user name: name do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end

    name = create_username 2
    user = create_user_hash 2
    # Use protobuf object
    client.get_user ::Google::Showcase::V1beta1::GetUserRequest.new(name: name) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end

    name = create_username 3
    user = create_user_hash 3
    # Use hash object with options
    client.get_user({ name: name }, rest_options) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end

    name = create_username 4
    user = create_user_hash 4
    # Use protobuf object with options
    client.get_user ::Google::Showcase::V1beta1::GetUserRequest.new(name: name), rest_options do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end
  end

  # @param id [Int, String]
  # @return [Hash {String => String}]
  def create_update_user_hash id
    user = create_user_hash "1"+id.to_s
    #user['name'] = create_username id
    user
  end

  # curl -X PATCH http://localhost:7469/v1beta1/users/0 \
  #    -H "Content-Type: application/json" \
  #    -H "Accept: application/json" \
  #    -d "{\"user\":{\"name\":\"users/0\",\"displayName\":\"ExampleName10\",\"email\":\"ExampleName10@example.com\"},\"updateMask\":\"displayName\"}"

  def test_update_user_real
    rest_options = {}
    client = ::Google::Showcase::V1beta1::Identity::Rest::Client.new

    update_mask = {
      paths: ["display_name"]
    }

    user = create_update_user_hash 1
    # Use hash object
    client.update_user({ user: user, update_mask: update_mask }) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end

    user = create_update_user_hash 1
    # Use named arguments
    client.update_user user: user, update_mask: update_mask do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end

    user = create_update_user_hash 2
    # Use protobuf object
    client.update_user ::Google::Showcase::V1beta1::UpdateUserRequest.new(user: user, update_mask: update_mask) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end

    user = create_update_user_hash 3
    # Use hash object with options
    client.update_user({ user: user, update_mask: update_mask }, rest_options) do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end

    user = create_update_user_hash 4
    # Use protobuf object with options
    #noinspection RubyYardParamTypeMatch
    client.update_user ::Google::Showcase::V1beta1::UpdateUserRequest.new(user: user, update_mask: update_mask), rest_options do |result, env|
      assert_equal 200, result[:status]

      result_user = JSON.parse(result[:body])
      assert_equal user['display_name'], result_user['displayName']

      request_user = JSON.parse(env.request_body)['user']
      assert_equal user['display_name'], request_user['displayName']
    end
  end

  def test_delete_user_real
    rest_options = {}
    client = ::Google::Showcase::V1beta1::Identity::Rest::Client.new

    name = create_username 0
    # Use hash object
    client.delete_user({ name: name }) do |result, env|
      assert_equal 200, result[:status]

      # result_user = JSON.parse(result[:body])
      # assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end

    name = create_username 1
    # Use named arguments
    client.delete_user name: name do |result, env|
      assert_equal 200, result[:status]

      # result_user = JSON.parse(result[:body])
      # assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end

    name = create_username 2
    # Use protobuf object
    client.delete_user ::Google::Showcase::V1beta1::DeleteUserRequest.new(name: name) do |result, env|
      assert_equal 200, result[:status]

      # result_user = JSON.parse(result[:body])
      # assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end

    name = create_username 3
    # Use hash object with options
    client.delete_user({ name: name }, rest_options) do |result, env|
      assert_equal 200, result[:status]

      # result_user = JSON.parse(result[:body])
      # assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end

    name = create_username 4
    # Use protobuf object with options
    client.delete_user ::Google::Showcase::V1beta1::DeleteUserRequest.new(name: name), rest_options do |result, env|
      assert_equal 200, result[:status]

      # result_user = JSON.parse(result[:body])
      # assert_equal user['display_name'], result_user['displayName']

      # request_user = JSON.parse(env.request_body)['user']
      # assert_equal user['display_name'], request_user['displayName']
    end
  end

end
