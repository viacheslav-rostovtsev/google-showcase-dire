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
        module SecurityPolicies
          module Rest
            ##
            # REST service stub for the SecurityPolicies service.
            #
            class ServiceStub
              ##
              # Create a new SecurityPolicies REST service stub object.
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
              # Inserts a rule into a security policy.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AddRuleSecurityPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def add_rule request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies/#{request_pb.security_policy}/addRule"
                body = request_pb.security_policy_rule_resource.to_json

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
              # Deletes the specified policy.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteSecurityPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies/#{request_pb.security_policy}"

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
              # List all of the ordered rules present in a single specified policy.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetSecurityPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SecurityPolicy]
              def get request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies/#{request_pb.security_policy}"

                response = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::SecurityPolicy.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Gets a rule at the specified priority.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetRuleSecurityPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SecurityPolicyRule]
              def get_rule request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies/#{request_pb.security_policy}/getRule"

                query_string_params = {}
                query_string_params["priority"] = request_pb.priority.to_s if request_pb.priority && request_pb.priority != 0

                response = @client_stub.make_get_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::SecurityPolicyRule.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Creates a new policy in the specified project using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertSecurityPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies"
                body = request_pb.security_policy_resource.to_json

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
              # List all the policies that have been configured for the specified project.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListSecurityPoliciesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SecurityPolicyList]
              def list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies"

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

                result = ::Google::Cloud::Compute::V1::SecurityPolicyList.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Gets the current list of preconfigured Web Application Firewall (WAF) expressions.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListPreconfiguredExpressionSetsSecurityPoliciesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SecurityPoliciesListPreconfiguredExpressionSetsResponse]
              def list_preconfigured_expression_sets request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies/listPreconfiguredExpressionSets"

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

                result = ::Google::Cloud::Compute::V1::SecurityPoliciesListPreconfiguredExpressionSetsResponse.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Patches the specified policy with the data included in the request. This cannot be used to be update the rules in the policy. Please use the per rule methods like addRule, patchRule, and removeRule instead.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PatchSecurityPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def patch request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies/#{request_pb.security_policy}"
                body = request_pb.security_policy_resource.to_json

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
              # Patches a rule at the specified priority.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PatchRuleSecurityPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def patch_rule request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies/#{request_pb.security_policy}/patchRule"
                body = request_pb.security_policy_rule_resource.to_json

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
              # Deletes a rule at the specified priority.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::RemoveRuleSecurityPolicyRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def remove_rule request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/securityPolicies/#{request_pb.security_policy}/removeRule"

                query_string_params = {}
                query_string_params["priority"] = request_pb.priority.to_s if request_pb.priority && request_pb.priority != 0

                response = @client_stub.make_post_request(
                  uri:     uri,
                  params:  query_string_params,
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
