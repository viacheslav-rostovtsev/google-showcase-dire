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
        module VpnGateways
          module Rest
            ##
            # REST service stub for the VpnGateways service.
            #
            class ServiceStub
              ##
              # Create a new VpnGateways REST service stub object.
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
              # Retrieves an aggregated list of VPN gateways.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListVpnGatewaysRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::VpnGatewayAggregatedList]
              def aggregated_list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AggregatedListVpnGatewaysRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/vpnGateways"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::VpnGatewayAggregatedList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Deletes the specified VPN gateway.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteVpnGatewayRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteVpnGatewayRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnGateways/#{request_pb.vpn_gateway}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns the specified VPN gateway. Gets a list of available VPN gateways by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetVpnGatewayRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::VpnGateway]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetVpnGatewayRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnGateways/#{request_pb.vpn_gateway}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::VpnGateway.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns the status for the specified VPN gateway.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetStatusVpnGatewayRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::VpnGatewaysGetStatusResponse]
              def get_status request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetStatusVpnGatewayRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnGateways/#{request_pb.vpn_gateway}/getStatus"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::VpnGatewaysGetStatusResponse.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates a VPN gateway in the specified project and region using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertVpnGatewayRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertVpnGatewayRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnGateways"
                body = request_pb.vpn_gateway_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves a list of VPN gateways available to the specified project and region.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListVpnGatewaysRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::VpnGatewayList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListVpnGatewaysRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnGateways"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::VpnGatewayList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Sets the labels on a VpnGateway. To learn more about labels, read the Labeling Resources documentation.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetLabelsVpnGatewayRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def set_labels request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::SetLabelsVpnGatewayRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnGateways/#{request_pb.resource}/setLabels"
                body = request_pb.region_set_labels_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns permissions that a caller has on the specified resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::TestIamPermissionsVpnGatewayRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TestPermissionsResponse]
              def test_iam_permissions request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::TestIamPermissionsVpnGatewayRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/vpnGateways/#{request_pb.resource}/testIamPermissions"
                body = request_pb.test_permissions_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TestPermissionsResponse.decode_json result_json[:body], { ignore_unknown_fields: true }
              end
            end
          end
        end
      end
    end
  end
end
