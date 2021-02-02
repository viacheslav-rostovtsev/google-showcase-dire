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
        module Routers
          module Rest
            ##
            # REST service stub for the Routers service.
            #
            class ServiceStub
              ##
              # Create a new Routers REST service stub object.
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
              # Retrieves an aggregated list of routers.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListRoutersRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::RouterAggregatedList]
              def aggregated_list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/routers"

                query_string_params = {}
                query_string_params["filter"] = request_pb.filter.to_s if request_pb.filter && request_pb.filter != ""
                query_string_params["includeAllScopes"] = request_pb.include_all_scopes.to_s if request_pb.include_all_scopes && request_pb.include_all_scopes != false
                query_string_params["maxResults"] = request_pb.max_results.to_s if request_pb.max_results && request_pb.max_results != 0
                query_string_params["orderBy"] =  request_pb.order_by.to_s if request_pb.order_by && request_pb.order_by != ""
                query_string_params["pageToken"] = request_pb.page_token.to_s if request_pb.page_token && request_pb.page_token != ""
                query_string_params["returnPartialSuccess"] = request_pb.return_partial_success.to_s if request_pb.return_partial_success && request_pb.return_partial_success != false

                response = @client_stub.make_get_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::RouterAggregatedList.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Deletes the specified Router resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteRouterRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers/#{request_pb.router}"

                query_string_params = {}
                query_string_params["requestId"] =  request_pb.request_id.to_s if request_pb.request_id && request_pb.request_id != ""

                response = @client_stub.make_delete_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Operation.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Returns the specified Router resource. Gets a list of available routers by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetRouterRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Router]
              def get request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers/#{request_pb.router}"

                response = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Router.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Retrieves runtime Nat mapping information of VM endpoints.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetNatMappingInfoRoutersRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::VmEndpointNatMappingsList]
              def get_nat_mapping_info request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers/#{request_pb.router}/getNatMappingInfo"

                query_string_params = {}
                query_string_params["filter"] = request_pb.filter.to_s if request_pb.filter && request_pb.filter != ""
                query_string_params["maxResults"] = request_pb.max_results.to_s if request_pb.max_results && request_pb.max_results != 0
                query_string_params["orderBy"] =  request_pb.order_by.to_s if request_pb.order_by && request_pb.order_by != ""
                query_string_params["pageToken"] = request_pb.page_token.to_s if request_pb.page_token && request_pb.page_token != ""
                query_string_params["returnPartialSuccess"] = request_pb.return_partial_success.to_s if request_pb.return_partial_success && request_pb.return_partial_success != false

                response = @client_stub.make_get_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::VmEndpointNatMappingsList.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Retrieves runtime information of the specified router.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetRouterStatusRouterRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::RouterStatusResponse]
              def get_router_status request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers/#{request_pb.router}/getRouterStatus"

                response = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::RouterStatusResponse.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Creates a Router resource in the specified project and region using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertRouterRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers"
                body = request_pb.router_resource.to_json

                response = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Operation.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Retrieves a list of Router resources available to the specified project.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListRoutersRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::RouterList]
              def list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers"

                query_string_params = {}
                query_string_params["filter"] = request_pb.filter.to_s if request_pb.filter && request_pb.filter != ""
                query_string_params["maxResults"] = request_pb.max_results.to_s if request_pb.max_results && request_pb.max_results != 0
                query_string_params["orderBy"] =  request_pb.order_by.to_s if request_pb.order_by && request_pb.order_by != ""
                query_string_params["pageToken"] = request_pb.page_token.to_s if request_pb.page_token && request_pb.page_token != ""
                query_string_params["returnPartialSuccess"] = request_pb.return_partial_success.to_s if request_pb.return_partial_success && request_pb.return_partial_success != false

                response = @client_stub.make_get_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::RouterList.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Patches the specified Router resource with the data included in the request. This method supports PATCH semantics and uses JSON merge patch format and processing rules.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PatchRouterRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def patch request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers/#{request_pb.router}"
                body = request_pb.router_resource.to_json

                response = @client_stub.make_patch_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Operation.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Preview fields auto-generated during router create and update operations. Calling this method does NOT create or update the router.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PreviewRouterRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::RoutersPreviewResponse]
              def preview request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers/#{request_pb.router}/preview"
                body = request_pb.router_resource.to_json

                response = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::RoutersPreviewResponse.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Updates the specified Router resource with the data included in the request. This method conforms to PUT semantics, which requests that the state of the target resource be created or replaced with the state defined by the representation enclosed in the request message payload.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::UpdateRouterRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def update request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/routers/#{request_pb.router}"
                body = request_pb.router_resource.to_json

                response = @client_stub.make_put_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Operation.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end
            end
          end
        end
      end
    end
  end
end
