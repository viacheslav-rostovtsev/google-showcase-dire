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

require "googleauth"

module Gapic
  module Rest
    class ClientStub
      def initialize endpoint:, credentials:
        @endpoint = endpoint
        @endpoint = "http://#{endpoint}" unless /https?:/.match? endpoint
        @endpoint = @endpoint.chop if @endpoint.to_s.chars.last == "/"

        @credentials = credentials
      end

      # @param uri [String]
      # @return [Hash { Symbol => String }]
      def make_get_request uri:, options:
        request_url = "#{@endpoint}/#{uri}"
        response = Faraday.get(
          request_url
        )
        result = response.to_hash
        yield result, response.env if block_given?
        result
      end

      # @param uri [String]
      # @return [Hash { Symbol => String }]
      def make_delete_request uri:, options:
        request_url = "#{@endpoint}/#{uri}"
        response = Faraday.delete(
          request_url
        )
        result = response.to_hash
        yield result, response.env if block_given?
        result
      end

      # @param uri [String]
      # @param body [String]
      # @return [Hash { Symbol => String }]
      def make_post_request uri:, body:, options:
        request_url = "#{@endpoint}/#{uri}"
        response = Faraday.post(
          request_url,
          body,
          "Content-Type" => "application/json"
        )
        result = response.to_hash
        yield result, response.env if block_given?
        result
      end

      # @param uri [String]
      # @param body [String]
      # @return [Hash { Symbol => String }]
      def make_patch_request uri:, body:, options:
        request_url = "#{@endpoint}/#{uri}"
        response = Faraday.put(
          request_url,
          body,
          "Content-Type" => "application/json"
        )
        result = response.to_hash
        yield result, response.env if block_given?
        result
      end
    end
  end
end