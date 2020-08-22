# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: temporal/api/filter/v1/message.proto

require 'google/protobuf'

require 'google/protobuf/timestamp_pb'
require 'temporal/api/enums/v1/workflow_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("temporal/api/filter/v1/message.proto", :syntax => :proto3) do
    add_message "temporal.api.filter.v1.WorkflowExecutionFilter" do
      optional :workflow_id, :string, 1
      optional :run_id, :string, 2
    end
    add_message "temporal.api.filter.v1.WorkflowTypeFilter" do
      optional :name, :string, 1
    end
    add_message "temporal.api.filter.v1.StartTimeFilter" do
      optional :earliest_time, :message, 1, "google.protobuf.Timestamp"
      optional :latest_time, :message, 2, "google.protobuf.Timestamp"
    end
    add_message "temporal.api.filter.v1.StatusFilter" do
      optional :status, :enum, 1, "temporal.api.enums.v1.WorkflowExecutionStatus"
    end
  end
end

module Temporal
  module Api
    module Filter
      module V1
        WorkflowExecutionFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.filter.v1.WorkflowExecutionFilter").msgclass
        WorkflowTypeFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.filter.v1.WorkflowTypeFilter").msgclass
        StartTimeFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.filter.v1.StartTimeFilter").msgclass
        StatusFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.filter.v1.StatusFilter").msgclass
      end
    end
  end
end
