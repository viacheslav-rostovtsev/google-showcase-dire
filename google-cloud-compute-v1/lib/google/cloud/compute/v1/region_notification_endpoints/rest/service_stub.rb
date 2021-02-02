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
        module RegionNotificationEndpoints
          module Rest
            ##
            # REST service stub for the RegionNotificationEndpoints service.
            #
            class ServiceStub
              ##
              # Create a new RegionNotificationEndpoints REST service stub object.
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
              # Deletes the specified NotificationEndpoint in the given region
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteRegionNotificationEndpointRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/notificationEndpoints/#{request_pb.notification_endpoint}"

                query_string_params = {}
                query_string_params["requestId"] = request_pb.request_id.to_s if request_pb.request_id && request_pb.request_id != ""

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Returns the specified NotificationEndpoint resource in the given region.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetRegionNotificationEndpointRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::NotificationEndpoint]
              def get request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/notificationEndpoints/#{request_pb.notification_endpoint}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::NotificationEndpoint.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Create a NotificationEndpoint in the specified project in the given region using the parameters that are included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertRegionNotificationEndpointRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/notificationEndpoints"
                body = request_pb.notification_endpoint_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Lists the NotificationEndpoints for a project in the given region.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListRegionNotificationEndpointsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::NotificationEndpointList]
              def list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/notificationEndpoints"

                query_string_params = {}
                query_string_params["filter"] = request_pb.filter.to_s if request_pb.filter && request_pb.filter != ""
                query_string_params["maxResults"] = request_pb.max_results.to_s if request_pb.max_results && request_pb.max_results != 0
                query_string_params["orderBy"] =  request_pb.order_by.to_s if request_pb.order_by && request_pb.order_by != ""
                query_string_params["pageToken"] = request_pb.page_token.to_s if request_pb.page_token && request_pb.page_token != ""
                query_string_params["returnPartialSuccess"] = request_pb.return_partial_success.to_s if request_pb.return_partial_success && request_pb.return_partial_success != false

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::NotificationEndpointList.decode_json result_json[:body], ignore_unknown_fields: true
              end
            end
          end
        end
      end
    end
  end
end
