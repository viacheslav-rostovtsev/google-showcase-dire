# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: schema/google/showcase/v1beta1/echo.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/duration_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("schema/google/showcase/v1beta1/echo.proto", :syntax => :proto3) do
    add_message "google.showcase.v1beta1.EchoRequest" do
      optional :severity, :enum, 3, "google.showcase.v1beta1.Severity"
      oneof :response do
        optional :content, :string, 1
        optional :error, :message, 2, "google.rpc.Status"
      end
    end
    add_message "google.showcase.v1beta1.EchoResponse" do
      optional :content, :string, 1
      optional :severity, :enum, 2, "google.showcase.v1beta1.Severity"
    end
    add_message "google.showcase.v1beta1.ExpandRequest" do
      optional :content, :string, 1
      optional :error, :message, 2, "google.rpc.Status"
    end
    add_message "google.showcase.v1beta1.PagedExpandRequest" do
      optional :content, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.showcase.v1beta1.PagedExpandResponse" do
      repeated :responses, :message, 1, "google.showcase.v1beta1.EchoResponse"
      optional :next_page_token, :string, 2
    end
    add_message "google.showcase.v1beta1.WaitRequest" do
      oneof :end do
        optional :end_time, :message, 1, "google.protobuf.Timestamp"
        optional :ttl, :message, 4, "google.protobuf.Duration"
      end
      oneof :response do
        optional :error, :message, 2, "google.rpc.Status"
        optional :success, :message, 3, "google.showcase.v1beta1.WaitResponse"
      end
    end
    add_message "google.showcase.v1beta1.WaitResponse" do
      optional :content, :string, 1
    end
    add_message "google.showcase.v1beta1.WaitMetadata" do
      optional :end_time, :message, 1, "google.protobuf.Timestamp"
    end
    add_message "google.showcase.v1beta1.BlockRequest" do
      optional :response_delay, :message, 1, "google.protobuf.Duration"
      oneof :response do
        optional :error, :message, 2, "google.rpc.Status"
        optional :success, :message, 3, "google.showcase.v1beta1.BlockResponse"
      end
    end
    add_message "google.showcase.v1beta1.BlockResponse" do
      optional :content, :string, 1
    end
    add_message "google.showcase.v1beta1.DataPack" do
      optional :subpack, :message, 1, "google.showcase.v1beta1.DataPack"
      optional :f_string, :string, 2
      optional :f_int32, :int32, 3
      optional :f_sint32, :sint32, 4
      optional :f_sfixed32, :sfixed32, 5
      optional :f_uint32, :uint32, 6
      optional :f_fixed32, :fixed32, 7
      optional :f_int64, :int64, 8
      optional :f_sint64, :sint64, 9
      optional :f_sfixed64, :sfixed64, 10
      optional :f_uint64, :uint64, 11
      optional :f_fixed64, :fixed64, 12
      optional :f_double, :double, 13
      optional :f_float, :float, 14
      optional :f_bool, :bool, 15
      optional :f_bytes, :bytes, 16
      proto3_optional :p_string, :string, 17
      proto3_optional :p_int32, :int32, 18
      proto3_optional :p_double, :double, 19
      proto3_optional :p_bool, :bool, 20
    end
    add_enum "google.showcase.v1beta1.Severity" do
      value :UNNECESSARY, 0
      value :NECESSARY, 1
      value :URGENT, 2
      value :CRITICAL, 3
    end
  end
end

module Google
  module Showcase
    module V1beta1
      EchoRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.EchoRequest").msgclass
      EchoResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.EchoResponse").msgclass
      ExpandRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.ExpandRequest").msgclass
      PagedExpandRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.PagedExpandRequest").msgclass
      PagedExpandResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.PagedExpandResponse").msgclass
      WaitRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.WaitRequest").msgclass
      WaitResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.WaitResponse").msgclass
      WaitMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.WaitMetadata").msgclass
      BlockRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.BlockRequest").msgclass
      BlockResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.BlockResponse").msgclass
      DataPack = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.DataPack").msgclass
      Severity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.showcase.v1beta1.Severity").enummodule
    end
  end
end