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
        module TargetTcpProxies
          module Rest
            ##
            # REST service stub for the TargetTcpProxies service.
            #
            class ServiceStub
              ##
              # Create a new TargetTcpProxies REST service stub object.
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
              # Deletes the specified TargetTcpProxy resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteTargetTcpProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteTargetTcpProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetTcpProxies/#{request_pb.target_tcp_proxy}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns the specified TargetTcpProxy resource. Gets a list of available target TCP proxies by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetTargetTcpProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetTcpProxy]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetTargetTcpProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetTcpProxies/#{request_pb.target_tcp_proxy}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetTcpProxy.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates a TargetTcpProxy resource in the specified project using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertTargetTcpProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertTargetTcpProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetTcpProxies"
                body = request_pb.target_tcp_proxy_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves the list of TargetTcpProxy resources available to the specified project.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListTargetTcpProxiesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetTcpProxyList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListTargetTcpProxiesRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetTcpProxies"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetTcpProxyList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Changes the BackendService for TargetTcpProxy.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetBackendServiceTargetTcpProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def set_backend_service request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::SetBackendServiceTargetTcpProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetTcpProxies/#{request_pb.target_tcp_proxy}/setBackendService"
                body = request_pb.target_tcp_proxies_set_backend_service_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Changes the ProxyHeaderType for TargetTcpProxy.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetProxyHeaderTargetTcpProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def set_proxy_header request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::SetProxyHeaderTargetTcpProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/targetTcpProxies/#{request_pb.target_tcp_proxy}/setProxyHeader"
                body = request_pb.target_tcp_proxies_set_proxy_header_request_resource.to_json

                result_json = @client_stub.make_post_request(
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
