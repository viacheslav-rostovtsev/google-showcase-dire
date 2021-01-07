# Copyright 2019 Google LLC
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

require "googleauth"

module Gapic
  module Rest
    class ServiceStubRest
      def initialize service_contract, endpoint:, credentials:
        @service_contract = service_contract
        @endpoint = endpoint
        @credentials = credentials
      end

      # @param endpoint [String]
      # @param request [String]
      # @return [Hash { Symbol => String }]
      def make_post_request endpoint:, request:, options:
        request_url = "#{@endpoint}/#{endpoint}"
        response = Faraday.post(
          request_url,
          request,
          "Content-Type" => "application/json"
        )
        result = {
          status: response.status,
          headers: response.headers,
          body: response.body
        }
        yield result, response if block_given?
        result
      end

      def call_rest method_name:, request:, options: nil, &block
        rpc_call = @service_contract[method_name]
        make_post_request endpoint: rpc_call[:endpoint], request: request, options: options, &block
      end
    end
  end
end