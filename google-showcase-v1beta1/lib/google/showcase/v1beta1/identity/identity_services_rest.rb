# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

# protobuf messages
require "schema/google/showcase/v1beta1/identity_pb"

# gapic-common REST code
require "gapic/rest"

# json to manipulate fields during transcoding
require "json"

module Google
  module Showcase
    module V1beta1
      module Identity
        class RestServiceStub
          def initialize endpoint:, credentials:
            @client_stub = ::Gapic::Rest::ClientStub.new endpoint: endpoint, credentials: credentials
          end

          # @param request_pb [::Google::Showcase::V1beta1::CreateUserRequest]
          # @param options [::Gapic::CallOptions]
          # @return [::Google::Showcase::V1beta1::User]
          def create_user request_pb:, options:, &block
            request_json = JSON.parse ::Google::Showcase::V1beta1::CreateUserRequest.encode_json(request_pb)

            uri = "v1beta1/users"
            body = request_json.to_json

            result_json = @client_stub.make_post_request(
              uri:     uri,
              body:    body,
              options: options,
              &block
            )

            ::Google::Showcase::V1beta1::User.decode_json result_json
          end

          # @param request_pb [::Google::Showcase::V1beta1::GetUserRequest]
          # @param options [::Gapic::CallOptions]
          # @return [::Google::Showcase::V1beta1::User]
          def get_user request_pb:, options:, &block
            request_json = JSON.parse ::Google::Showcase::V1beta1::GetUserRequest.encode_json(request_pb)

            # pretending here that the pattern is simpler because that's what DIREGAPIC supports
            # get:"/v1beta1/{name}"
            uri = "v1beta1/#{request_json['name']}"

            result_json = @client_stub.make_get_request(
              uri:     uri,
              options: options,
              &block
            )

            ::Google::Showcase::V1beta1::User.decode_json result_json
          end

          # @param request_pb [::Google::Showcase::V1beta1::UpdateUserRequest]
          # @param options [::Gapic::CallOptions]
          # @return [::Google::Showcase::V1beta1::User]
          def update_user request_pb:, options:, &block
            request_json = JSON.parse ::Google::Showcase::V1beta1::UpdateUserRequest.encode_json(request_pb)

            # pretending here that the pattern is simpler because that's what DIREGAPIC supports
            # patch:"/v1beta1/{user.name}"
            uri = "v1beta1/#{request_json['user']['name']}"
            body = request_json.to_json

            result_json = @client_stub.make_patch_request(
              uri:     uri,
              body:    body,
              options: options,
              &block
            )

            ::Google::Showcase::V1beta1::User.decode_json result_json
          end

          # @param request_pb [::Google::Showcase::V1beta1::DeleteUserRequest]
          # @param options [::Gapic::CallOptions]
          # @return [::Google::Protobuf::Empty]
          def delete_user request_pb:, options:, &block
            request_json = JSON.parse ::Google::Showcase::V1beta1::DeleteUserRequest.encode_json(request_pb)

            # pretending here that the pattern is simpler because that's what DIREGAPIC supports
            # delete:"/v1beta1/{name}"
            uri = "v1beta1/#{request_json['name']}"

            result_json = @client_stub.make_delete_request(
              uri:     uri,
              options: options,
              &block
            )

            ::Google::Protobuf::Empty.decode_json result_json
          end
        end
      end
    end
  end
end
