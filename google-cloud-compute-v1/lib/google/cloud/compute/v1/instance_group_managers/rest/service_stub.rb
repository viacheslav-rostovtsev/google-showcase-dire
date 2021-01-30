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
        module InstanceGroupManagers
          module Rest
            ##
            # REST service stub for the InstanceGroupManagers service.
            #
            class ServiceStub
              ##
              # Create a new InstanceGroupManagers REST service stub object.
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
              # Flags the specified instances to be removed from the managed instance group. Abandoning an instance does not delete the instance, but it does remove the instance from any target pools that are applied by the managed instance group. This method reduces the targetSize of the managed instance group by the number of instances that you abandon. This operation is marked as DONE when the action is scheduled even if the instances have not yet been removed from the group. You must separately verify the status of the abandoning action with the listmanagedinstances method.
              #
              # If the group is part of a backend service that has enabled connection draining, it can take up to 60 seconds after the connection draining duration has elapsed before the VM instance is removed or deleted.
              #
              # You can specify a maximum of 1000 instances with this method per request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AbandonInstancesInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def abandon_instances request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AbandonInstancesInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/abandonInstances"
                body = request_pb.instance_group_managers_abandon_instances_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves the list of managed instance groups and groups them by zone.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListInstanceGroupManagersRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::InstanceGroupManagerAggregatedList]
              def aggregated_list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AggregatedListInstanceGroupManagersRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/instanceGroupManagers"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::InstanceGroupManagerAggregatedList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Applies changes to selected instances on the managed instance group. This method can be used to apply new overrides and/or new versions.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ApplyUpdatesToInstancesInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def apply_updates_to_instances request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ApplyUpdatesToInstancesInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/applyUpdatesToInstances"
                body = request_pb.instance_group_managers_apply_updates_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates instances with per-instance configs in this managed instance group. Instances are created using the current instance template. The create instances operation is marked DONE if the createInstances request is successful. The underlying actions take additional time. You must separately verify the status of the creating or actions with the listmanagedinstances method.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::CreateInstancesInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def create_instances request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::CreateInstancesInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/createInstances"
                body = request_pb.instance_group_managers_create_instances_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Deletes the specified managed instance group and all of the instances in that group. Note that the instance group must not belong to a backend service. Read  Deleting an instance group for more information.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Flags the specified instances in the managed instance group for immediate deletion. The instances are also removed from any target pools of which they were a member. This method reduces the targetSize of the managed instance group by the number of instances that you delete. This operation is marked as DONE when the action is scheduled even if the instances are still being deleted. You must separately verify the status of the deleting action with the listmanagedinstances method.
              #
              # If the group is part of a backend service that has enabled connection draining, it can take up to 60 seconds after the connection draining duration has elapsed before the VM instance is removed or deleted.
              #
              # You can specify a maximum of 1000 instances with this method per request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteInstancesInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete_instances request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteInstancesInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/deleteInstances"
                body = request_pb.instance_group_managers_delete_instances_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Deletes selected per-instance configs for the managed instance group.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeletePerInstanceConfigsInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete_per_instance_configs request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeletePerInstanceConfigsInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/deletePerInstanceConfigs"
                body = request_pb.instance_group_managers_delete_per_instance_configs_req_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns all of the details about the specified managed instance group. Gets a list of available managed instance groups by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::InstanceGroupManager]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::InstanceGroupManager.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates a managed instance group using the information that you specify in the request. After the group is created, instances in the group are created using the specified instance template. This operation is marked as DONE when the group is created even if the instances in the group have not yet been created. You must separately verify the status of the individual instances with the listmanagedinstances method.
              #
              # A managed instance group can have up to 1000 VM instances per group. Please contact Cloud Support if you need an increase in this limit.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers"
                body = request_pb.instance_group_manager_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves a list of managed instance groups that are contained within the specified project and zone.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListInstanceGroupManagersRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::InstanceGroupManagerList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListInstanceGroupManagersRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::InstanceGroupManagerList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Lists all errors thrown by actions on instances for a given managed instance group. The filter and orderBy query parameters are not supported.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListErrorsInstanceGroupManagersRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::InstanceGroupManagersListErrorsResponse]
              def list_errors request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListErrorsInstanceGroupManagersRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/listErrors"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::InstanceGroupManagersListErrorsResponse.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Lists all of the instances in the managed instance group. Each instance in the list has a currentAction, which indicates the action that the managed instance group is performing on the instance. For example, if the group is still creating an instance, the currentAction is CREATING. If a previous action failed, the list displays the errors for that failed action. The orderBy query parameter is not supported.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListManagedInstancesInstanceGroupManagersRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::InstanceGroupManagersListManagedInstancesResponse]
              def list_managed_instances request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListManagedInstancesInstanceGroupManagersRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/listManagedInstances"

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::InstanceGroupManagersListManagedInstancesResponse.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Lists all of the per-instance configs defined for the managed instance group. The orderBy query parameter is not supported.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListPerInstanceConfigsInstanceGroupManagersRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::InstanceGroupManagersListPerInstanceConfigsResp]
              def list_per_instance_configs request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListPerInstanceConfigsInstanceGroupManagersRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/listPerInstanceConfigs"

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::InstanceGroupManagersListPerInstanceConfigsResp.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Updates a managed instance group using the information that you specify in the request. This operation is marked as DONE when the group is patched even if the instances in the group are still in the process of being patched. You must separately verify the status of the individual instances with the listManagedInstances method. This method supports PATCH semantics and uses the JSON merge patch format and processing rules.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PatchInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def patch request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::PatchInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}"
                body = request_pb.instance_group_manager_resource.to_json

                result_json = @client_stub.make_patch_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Inserts or patches per-instance configs for the managed instance group. perInstanceConfig.name serves as a key used to distinguish whether to perform insert or patch.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::PatchPerInstanceConfigsInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def patch_per_instance_configs request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::PatchPerInstanceConfigsInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/patchPerInstanceConfigs"
                body = request_pb.instance_group_managers_patch_per_instance_configs_req_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Flags the specified instances in the managed instance group to be immediately recreated. The instances are deleted and recreated using the current instance template for the managed instance group. This operation is marked as DONE when the flag is set even if the instances have not yet been recreated. You must separately verify the status of the recreating action with the listmanagedinstances method.
              #
              # If the group is part of a backend service that has enabled connection draining, it can take up to 60 seconds after the connection draining duration has elapsed before the VM instance is removed or deleted.
              #
              # You can specify a maximum of 1000 instances with this method per request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::RecreateInstancesInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def recreate_instances request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::RecreateInstancesInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/recreateInstances"
                body = request_pb.instance_group_managers_recreate_instances_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Resizes the managed instance group. If you increase the size, the group creates new instances using the current instance template. If you decrease the size, the group deletes instances. The resize operation is marked DONE when the resize actions are scheduled even if the group has not yet added or deleted any instances. You must separately verify the status of the creating or deleting actions with the listmanagedinstances method.
              #
              # When resizing down, the instance group arbitrarily chooses the order in which VMs are deleted. The group takes into account some VM attributes when making the selection including:
              #
              # + The status of the VM instance. + The health of the VM instance. + The instance template version the VM is based on. + For regional managed instance groups, the location of the VM instance.
              #
              # This list is subject to change.
              #
              # If the group is part of a backend service that has enabled connection draining, it can take up to 60 seconds after the connection draining duration has elapsed before the VM instance is removed or deleted.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ResizeInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def resize request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ResizeInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/resize"

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Specifies the instance template to use when creating new instances in this group. The templates for existing instances in the group do not change unless you run recreateInstances, run applyUpdatesToInstances, or set the group's updatePolicy.type to PROACTIVE.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetInstanceTemplateInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def set_instance_template request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::SetInstanceTemplateInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/setInstanceTemplate"
                body = request_pb.instance_group_managers_set_instance_template_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Modifies the target pools to which all instances in this managed instance group are assigned. The target pools automatically apply to all of the instances in the managed instance group. This operation is marked DONE when you make the request even if the instances have not yet been added to their target pools. The change might take some time to apply to all of the instances in the group depending on the size of the group.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::SetTargetPoolsInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def set_target_pools request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::SetTargetPoolsInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/setTargetPools"
                body = request_pb.instance_group_managers_set_target_pools_request_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Inserts or updates per-instance configs for the managed instance group. perInstanceConfig.name serves as a key used to distinguish whether to perform insert or patch.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::UpdatePerInstanceConfigsInstanceGroupManagerRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def update_per_instance_configs request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::UpdatePerInstanceConfigsInstanceGroupManagerRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/zones/#{request_pb.zone}/instanceGroupManagers/#{request_pb.instance_group_manager}/updatePerInstanceConfigs"
                body = request_pb.instance_group_managers_update_per_instance_configs_req_resource.to_json

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
