# frozen_string_literal: true

# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "gapic/rest"
require "google/cloud/compute/v1/compute_small_pb"

module Google
  module Cloud
    module Compute
      module V1
        module TargetGrpcProxies
          module Rest
            ##
            # REST service stub for the TargetGrpcProxies service.
            #
            class ServiceStub
              ##
              # Create a new TargetGrpcProxies REST service stub object.
              #
              # @param endpoint [String]
              #   The hostname or hostname:port of the service endpoint.
              #   Defaults to `"localhost:7469"`.
              #
              # @param credentials [Google::Auth::Credentials]
              #   Credentials to send with calls in form of a googleauth credentials object.
              #   (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
              #
              def initialize endpoint:, credentials:
                @client_stub = ::Gapic::Rest::ClientStub.new endpoint: endpoint, credentials: credentials
              end

              # Service calls

              ##
              # Deletes the specified TargetGrpcProxy in the given scope
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteTargetGrpcProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteTargetGrpcProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetGrpcProxies/#{request_pb.target_grpc_proxy}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns the specified TargetGrpcProxy resource in the given scope.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetTargetGrpcProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetGrpcProxy]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetTargetGrpcProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetGrpcProxies/#{request_pb.target_grpc_proxy}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetGrpcProxy.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates a TargetGrpcProxy in the specified project in the given scope using the parameters that are included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertTargetGrpcProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertTargetGrpcProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetGrpcProxies"
                body = request_pb.target_grpc_proxy_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Lists the TargetGrpcProxies for a project in the given scope.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListTargetGrpcProxiesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetGrpcProxyList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListTargetGrpcProxiesRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetGrpcProxies"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetGrpcProxyList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Patches the specified TargetGrpcProxy resource with the data included in the request. This method supports PATCH semantics and uses JSON merge patch format and processing rules.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PatchTargetGrpcProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def patch request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::PatchTargetGrpcProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetGrpcProxies/#{request_pb.target_grpc_proxy}"
                body = request_pb.target_grpc_proxy_resource.to_json

                result_json = @client_stub.make_patch_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end
            end
          end
        end
      end
    end
  end
end
