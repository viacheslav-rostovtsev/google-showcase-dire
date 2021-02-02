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
        module RegionCommitments
          module Rest
            ##
            # REST service stub for the RegionCommitments service.
            #
            class ServiceStub
              ##
              # Create a new RegionCommitments REST service stub object.
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
              # Retrieves an aggregated list of commitments.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListRegionCommitmentsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::CommitmentAggregatedList]
              def aggregated_list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/commitments"

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

                result = ::Google::Cloud::Compute::V1::CommitmentAggregatedList.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Returns the specified commitment resource. Gets a list of available commitments by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetRegionCommitmentRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Commitment]
              def get request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/commitments/#{request_pb.commitment}"

                response = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                )

                result = ::Google::Cloud::Compute::V1::Commitment.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?

                result
              end

              ##
              # Creates a commitment in the specified project using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertRegionCommitmentRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/commitments"
                body = request_pb.commitment_resource.to_json

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
              # Retrieves a list of commitments contained within the specified region.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListRegionCommitmentsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::CommitmentList]
              def list request_pb, options:, &block
                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/commitments"

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

                result = ::Google::Cloud::Compute::V1::CommitmentList.decode_json response.body, ignore_unknown_fields: true

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
