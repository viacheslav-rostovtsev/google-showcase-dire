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
        module SslPolicies
          module Rest
            ##
            # REST service stub for the SslPolicies service.
            #
            class ServiceStub
              ##
              # Create a new SslPolicies REST service stub object.
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
              # Deletes the specified SSL policy. The SSL policy resource can be deleted only if it is not in use by any TargetHttpsProxy or TargetSslProxy resources.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteSslPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/sslPolicies/#{request_pb.ssl_policy}"

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
              # Lists all of the ordered rules present in a single specified policy.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetSslPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SslPolicy]
              def get request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/sslPolicies/#{request_pb.ssl_policy}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::SslPolicy.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Returns the specified SSL policy resource. Gets a list of available SSL policies by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertSslPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/sslPolicies"
                body = request_pb.ssl_policy_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Lists all the SSL policies that have been configured for the specified project.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListSslPoliciesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SslPoliciesList]
              def list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/sslPolicies"

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

                ::Google::Cloud::Compute::V1::SslPoliciesList.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Lists all features that can be specified in the SSL policy when using custom profile.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListAvailableFeaturesSslPoliciesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SslPoliciesListAvailableFeaturesResponse]
              def list_available_features request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/sslPolicies/listAvailableFeatures"

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

                ::Google::Cloud::Compute::V1::SslPoliciesListAvailableFeaturesResponse.decode_json result_json[:body], ignore_unknown_fields: true
              end

              ##
              # Patches the specified SSL policy with the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PatchSslPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def patch request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/sslPolicies/#{request_pb.ssl_policy}"
                body = request_pb.ssl_policy_resource.to_json

                result_json = @client_stub.make_patch_request(
                  uri:     uri,
                  body:    body,
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
