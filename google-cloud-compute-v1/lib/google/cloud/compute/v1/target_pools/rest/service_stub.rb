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
        module TargetPools
          module Rest
            ##
            # REST service stub for the TargetPools service.
            #
            class ServiceStub
              ##
              # Create a new TargetPools REST service stub object.
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
              # Adds health check URLs to a target pool.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AddHealthCheckTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def add_health_check request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AddHealthCheckTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools/#{request_pb.target_pool}/addHealthCheck"
                body = request_pb.target_pools_add_health_check_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Adds an instance to a target pool.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AddInstanceTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def add_instance request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AddInstanceTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools/#{request_pb.target_pool}/addInstance"
                body = request_pb.target_pools_add_instance_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves an aggregated list of target pools.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListTargetPoolsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetPoolAggregatedList]
              def aggregated_list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AggregatedListTargetPoolsRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/targetPools"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetPoolAggregatedList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Deletes the specified target pool.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools/#{request_pb.target_pool}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns the specified target pool. Gets a list of available target pools by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetPool]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools/#{request_pb.target_pool}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetPool.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Gets the most recent health check results for each IP for the instance that is referenced by the given target pool.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetHealthTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetPoolInstanceHealth]
              def get_health request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetHealthTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools/#{request_pb.target_pool}/getHealth"
                body = request_pb.instance_reference_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetPoolInstanceHealth.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates a target pool in the specified project and region using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools"
                body = request_pb.target_pool_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves a list of target pools available to the specified project and region.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListTargetPoolsRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::TargetPoolList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListTargetPoolsRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::TargetPoolList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Removes health check URL from a target pool.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::RemoveHealthCheckTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def remove_health_check request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::RemoveHealthCheckTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools/#{request_pb.target_pool}/removeHealthCheck"
                body = request_pb.target_pools_remove_health_check_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Removes instance URL from a target pool.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::RemoveInstanceTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def remove_instance request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::RemoveInstanceTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools/#{request_pb.target_pool}/removeInstance"
                body = request_pb.target_pools_remove_instance_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Changes a backup target pool's configurations.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetBackupTargetPoolRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def set_backup request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::SetBackupTargetPoolRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/regions/#{request_pb.region}/targetPools/#{request_pb.target_pool}/setBackup"
                body = request_pb.target_reference_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end
            end
          end
        end
      end
    end
  end
end
