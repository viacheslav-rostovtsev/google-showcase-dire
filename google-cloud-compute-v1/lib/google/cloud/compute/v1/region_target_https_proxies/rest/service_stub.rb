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
        module RegionTargetHttpsProxies
          module Rest
            ##
            # REST service stub for the RegionTargetHttpsProxies service.
            #
            class ServiceStub
              ##
              # Create a new RegionTargetHttpsProxies REST service stub object.
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
              # Deletes the specified TargetHttpsProxy resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteRegionTargetHttpsProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteRegionTargetHttpsProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetHttpsProxies/#{request_pb.target_https_proxy}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns the specified TargetHttpsProxy resource in the specified region. Gets a list of available target HTTP proxies by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetRegionTargetHttpsProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetHttpsProxy]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetRegionTargetHttpsProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetHttpsProxies/#{request_pb.target_https_proxy}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetHttpsProxy.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates a TargetHttpsProxy resource in the specified project and region using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertRegionTargetHttpsProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertRegionTargetHttpsProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetHttpsProxies"
                body = request_pb.target_https_proxy_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves the list of TargetHttpsProxy resources available to the specified project in the specified region.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListRegionTargetHttpsProxiesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetHttpsProxyList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListRegionTargetHttpsProxiesRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetHttpsProxies"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetHttpsProxyList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Replaces SslCertificates for TargetHttpsProxy.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetSslCertificatesRegionTargetHttpsProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def set_ssl_certificates request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::SetSslCertificatesRegionTargetHttpsProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetHttpsProxies/#{request_pb.target_https_proxy}/setSslCertificates"
                body = request_pb.region_target_https_proxies_set_ssl_certificates_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Changes the URL map for TargetHttpsProxy.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetUrlMapRegionTargetHttpsProxyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def set_url_map request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::SetUrlMapRegionTargetHttpsProxyRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetHttpsProxies/#{request_pb.target_https_proxy}/setUrlMap"
                body = request_pb.url_map_reference_resource.to_json

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
