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
        module SslCertificates
          module Rest
            ##
            # REST service stub for the SslCertificates service.
            #
            class ServiceStub
              ##
              # Create a new SslCertificates REST service stub object.
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
              # Retrieves the list of all SslCertificate resources, regional and global, available to the specified project.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::AggregatedListSslCertificatesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SslCertificateAggregatedList]
              def aggregated_list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::AggregatedListSslCertificatesRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/aggregated/sslCertificates"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::SslCertificateAggregatedList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Deletes the specified SslCertificate resource.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::DeleteSslCertificateRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def delete request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::DeleteSslCertificateRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/sslCertificates/#{request_pb.ssl_certificate}"

                result_json = @client_stub.make_delete_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Returns the specified SslCertificate resource. Gets a list of available SSL certificates by making a list() request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::GetSslCertificateRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SslCertificate]
              def get request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::GetSslCertificateRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/sslCertificates/#{request_pb.ssl_certificate}"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::SslCertificate.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Creates a SslCertificate resource in the specified project using the data included in the request.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::InsertSslCertificateRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::Operation]
              def insert request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::InsertSslCertificateRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/sslCertificates"
                body = request_pb.ssl_certificate_resource.to_json

                result_json = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::Operation.decode_json result_json[:body], { ignore_unknown_fields: true }
              end

              ##
              # Retrieves the list of SslCertificate resources available to the specified project.
              #
              # @param request_pb [::Google::Cloud::Compute::V1::ListSslCertificatesRequest]
              #   A request object representing the call parameters. Required.
              # @param options [::Gapic::CallOptions]
              #   Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              # @return [::Google::Cloud::Compute::V1::SslCertificateList]
              def list request_pb, options:, &block
                request_json = JSON.parse ::Google::Cloud::Compute::V1::ListSslCertificatesRequest.encode_json(request_pb)

                uri = "/compute/v1/projects/#{request_pb.project}/global/sslCertificates"

                result_json = @client_stub.make_get_request(
                  uri:     uri,
                  options: options,
                  &block
                )

                ::Google::Cloud::Compute::V1::SslCertificateList.decode_json result_json[:body], { ignore_unknown_fields: true }
              end
            end
          end
        end
      end
    end
  end
end
