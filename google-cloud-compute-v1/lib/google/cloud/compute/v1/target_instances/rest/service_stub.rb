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
        module TargetInstances
          module Rest
            ##
            # REST service stub for the TargetInstances service.
            #
            class ServiceStub
              ##
              # Create a new TargetInstances REST service stub object.
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
              # Retrieves an aggregated list of target instances.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListTargetInstancesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetInstanceAggregatedList]
              def aggregated_list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AggregatedListTargetInstancesRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/targetInstances"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetInstanceAggregatedList.decode_json result_json[:body]
              end

              ##
              # Deletes the specified TargetInstance resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteTargetInstanceRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteTargetInstanceRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/targetInstances/#{request_pb.target_instance}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body]
              end

              ##
              # Returns the specified TargetInstance resource. Gets a list of available target instances by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetTargetInstanceRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetInstance]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetTargetInstanceRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/targetInstances/#{request_pb.target_instance}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetInstance.decode_json result_json[:body]
              end

              ##
              # Creates a TargetInstance resource in the specified project and zone using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertTargetInstanceRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertTargetInstanceRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/targetInstances"
                body = request_pb.target_instance_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body]
              end

              ##
              # Retrieves a list of TargetInstance resources available to the specified project and zone.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListTargetInstancesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetInstanceList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListTargetInstancesRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/targetInstances"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetInstanceList.decode_json result_json[:body]
              end
            end
          end
        end
      end
    end
  end
end
