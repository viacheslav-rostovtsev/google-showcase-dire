require "json"

module Gapic
  module Rest
    class Error < StandardError
      attr_accessor :result, :status_code

      # @param [String] msg
      # @param [Hash] result
      def initialize msg = nil, result:
        super_msg = msg
        status_code = nil

        if result.key? :status
          status_code = result[:status]
        end

        if result.key? :body
          message, code = try_parse_from_body result[:body]
          super_msg = "#{msg}: #{message}" if message
          status_code ||= code
        end

        super super_msg
        @status_code = status_code
        @result = result
      end

      # @param [String] body_str
      # @return [Array<String>]
      def try_parse_from_body body_str
        body = JSON.parse body_str
        return [nil, nil] unless !body.nil? && body.key?("error")

        message = body["error"]["message"] if body["error"].key? "message"
        code = body["error"]["message"] if body["error"].key? "code"

        [message, code]
      end
    end
  end
end
