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
        module VpnTunnels
          module Rest
            ##
            # REST service stub for the VpnTunnels service.
            #
            class ServiceStub
              ##
              # Create a new VpnTunnels REST service stub object.
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
              # Retrieves an aggregated list of VPN tunnels.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListVpnTunnelsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::VpnTunnelAggregatedList]
              def aggregated_list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AggregatedListVpnTunnelsRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/vpnTunnels"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::VpnTunnelAggregatedList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Deletes the specified VpnTunnel resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteVpnTunnelRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteVpnTunnelRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnTunnels/#{request_pb.vpn_tunnel}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns the specified VpnTunnel resource. Gets a list of available VPN tunnels by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetVpnTunnelRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::VpnTunnel]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetVpnTunnelRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnTunnels/#{request_pb.vpn_tunnel}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::VpnTunnel.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates a VpnTunnel resource in the specified project and region using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertVpnTunnelRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertVpnTunnelRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnTunnels"
                body = request_pb.vpn_tunnel_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves a list of VpnTunnel resources contained in the specified project and region.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListVpnTunnelsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::VpnTunnelList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListVpnTunnelsRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnTunnels"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::VpnTunnelList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end
            end
          end
        end
      end
    end
  end
end
