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
        module Licenses
          module Rest
            ##
            # REST service stub for the Licenses service.
            #
            class ServiceStub
              ##
              # Create a new Licenses REST service stub object.
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
              # Deletes the specified license.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteLicenseRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/licenses/#{request_pb.license}"

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
              # Returns the specified License resource.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetLicenseRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::License]
              def get request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/licenses/#{request_pb.license}"

                response = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::License.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Gets the access control policy for a resource. May be empty if no such policy or resource exists.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetIamPolicyLicenseRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Policy]
              def get_iam_policy request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/licenses/#{request_pb.resource}/getIamPolicy"

                query_string_params = {}
                query_string_params["optionsRequestedPolicyVersion"] = request_pb.options_requested_policy_version.to_s if request_pb.options_requested_policy_version && request_pb.options_requested_policy_version != 0

                response = @client_stub.make_get_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Policy.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Create a License resource in the specified project.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertLicenseRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/licenses"
                body = request_pb.license_resource.to_json

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
              # Retrieves the list of licenses available in the specified project. This method does not get any licenses that belong to other projects, including licenses attached to publicly-available images, like Debian 9. If you want to get a list of publicly-available licenses, use this method to make a request to the respective image project, such as debian-cloud or windows-cloud.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListLicensesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::LicensesListResponse]
              def list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/licenses"

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

                result = ::Google::Cloud::Compute::V1::LicensesListResponse.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Sets the access control policy on the specified resource. Replaces any existing policy.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetIamPolicyLicenseRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Policy]
              def set_iam_policy request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/licenses/#{request_pb.resource}/setIamPolicy"
                body = request_pb.global_set_policy_request_resource.to_json

                response = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Policy.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Returns permissions that a caller has on the specified resource.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::TestIamPermissionsLicenseRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TestPermissionsResponse]
              def test_iam_permissions request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/licenses/#{request_pb.resource}/testIamPermissions"
                body = request_pb.test_permissions_request_resource.to_json

                response = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::TestPermissionsResponse.decode_json response.body, ignore_unknown_fields: true

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
