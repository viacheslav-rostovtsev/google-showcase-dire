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
        module BackendBuckets
          module Rest
            ##
            # REST service stub for the BackendBuckets service.
            #
            class ServiceStub
              ##
              # Create a new BackendBuckets REST service stub object.
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
              # Adds a key for validating requests with signed URLs for this backend bucket.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AddSignedUrlKeyBackendBucketRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def add_signed_url_key request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/backendBuckets/#{request_pb.backend_bucket}/addSignedUrlKey"
                body = request_pb.signed_url_key_resource.to_json

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
              # Deletes the specified BackendBucket resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteBackendBucketRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/backendBuckets/#{request_pb.backend_bucket}"

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
              # Deletes a key for validating requests with signed URLs for this backend bucket.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteSignedUrlKeyBackendBucketRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete_signed_url_key request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/backendBuckets/#{request_pb.backend_bucket}/deleteSignedUrlKey"

                query_string_params = {}
                query_string_params["keyName"] = request_pb.key_name.to_s if request_pb.key_name && request_pb.key_name != ""
                query_string_params["requestId"] = request_pb.request_id.to_s if request_pb.request_id && request_pb.request_id != ""

                response = @client_stub.make_post_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Operation.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Returns the specified BackendBucket resource. Gets a list of available backend buckets by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetBackendBucketRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::BackendBucket]
              def get request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/backendBuckets/#{request_pb.backend_bucket}"

                response = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::BackendBucket.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Creates a BackendBucket resource in the specified project using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertBackendBucketRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/backendBuckets"
                body = request_pb.backend_bucket_resource.to_json

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
              # Retrieves the list of BackendBucket resources available to the specified project.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListBackendBucketsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::BackendBucketList]
              def list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/backendBuckets"

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

                result = ::Google::Cloud::Compute::V1::BackendBucketList.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Updates the specified BackendBucket resource with the data included in the request. This method supports PATCH semantics and uses the JSON merge patch format and processing rules.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PatchBackendBucketRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def patch request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/backendBuckets/#{request_pb.backend_bucket}"
                body = request_pb.backend_bucket_resource.to_json

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
              # Updates the specified BackendBucket resource with the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::UpdateBackendBucketRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def update request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/global/backendBuckets/#{request_pb.backend_bucket}"
                body = request_pb.backend_bucket_resource.to_json

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
