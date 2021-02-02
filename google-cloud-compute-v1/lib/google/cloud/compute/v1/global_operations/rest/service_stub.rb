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
        module GlobalOperations
          module Rest
            ##
            # REST service stub for the GlobalOperations service.
            #
            class ServiceStub
              ##
              # Create a new GlobalOperations REST service stub object.
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
              # Retrieves an aggregated list of all operations.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListGlobalOperationsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::OperationAggregatedList]
              def aggregated_list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/operations"

                query_string_params = {}
                query_string_params["filter"] = request_pb.filter.to_s if request_pb.filter && request_pb.filter != ""
                query_string_params["includeAllScopes"] = request_pb.include_all_scopes.to_s if request_pb.include_all_scopes && request_pb.include_all_scopes != false
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

                ::Google::Cloud::Compute::V1::OperationAggregatedList.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Deletes the specified Operations resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteGlobalOperationRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::DeleteGlobalOperationResponse]
              def delete request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/operations/#{request_pb.operation}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::DeleteGlobalOperationResponse.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Retrieves the specified Operations resource. Gets a list of operations by making a `list()` request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetGlobalOperationRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def get request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/operations/#{request_pb.operation}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Retrieves a list of Operation resources contained within the specified project.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListGlobalOperationsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::OperationList]
              def list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/operations"

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

                ::Google::Cloud::Compute::V1::OperationList.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Waits for the specified Operation resource to return as `DONE` or for the request to approach the 2 minute deadline, and retrieves the specified Operation resource. This method differs from the `GET` method in that it waits for no more than the default deadline (2 minutes) and then returns the current state of the operation, which might be `DONE` or still in progress.
              #
              # This method is called on a best-effort basis. Specifically:
              # - In uncommon cases, when the server is overloaded, the request might return before the default deadline is reached, or might return after zero seconds.
              # - If the default deadline is reached, there is no guarantee that the operation is actually done when the method returns. Be prepared to retry if the operation is not `DONE`.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::WaitGlobalOperationRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def wait request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/operations/#{request_pb.operation}/wait"

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], ignore_unknown_fields: true
              end
            end
          end
        end
      end
    end
  end
end
