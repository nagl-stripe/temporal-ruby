# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: temporal/api/workflowservice/v1/request_response.proto

require 'google/protobuf'

require 'google/protobuf/duration_pb'
require 'google/protobuf/timestamp_pb'
require 'temporal/api/enums/v1/workflow_pb'
require 'temporal/api/enums/v1/namespace_pb'
require 'temporal/api/enums/v1/failed_cause_pb'
require 'temporal/api/enums/v1/common_pb'
require 'temporal/api/enums/v1/query_pb'
require 'temporal/api/enums/v1/task_queue_pb'
require 'temporal/api/common/v1/message_pb'
require 'temporal/api/history/v1/message_pb'
require 'temporal/api/workflow/v1/message_pb'
require 'temporal/api/command/v1/message_pb'
require 'temporal/api/failure/v1/message_pb'
require 'temporal/api/filter/v1/message_pb'
require 'temporal/api/namespace/v1/message_pb'
require 'temporal/api/query/v1/message_pb'
require 'temporal/api/replication/v1/message_pb'
require 'temporal/api/taskqueue/v1/message_pb'
require 'temporal/api/version/v1/message_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("temporal/api/workflowservice/v1/request_response.proto", :syntax => :proto3) do
    add_message "temporal.api.workflowservice.v1.RegisterNamespaceRequest" do
      optional :name, :string, 1
      optional :description, :string, 2
      optional :owner_email, :string, 3
      optional :workflow_execution_retention_period, :message, 4, "google.protobuf.Duration"
      repeated :clusters, :message, 5, "temporal.api.replication.v1.ClusterReplicationConfig"
      optional :active_cluster_name, :string, 6
      map :data, :string, :string, 7
      optional :security_token, :string, 8
      optional :is_global_namespace, :bool, 9
      optional :history_archival_state, :enum, 10, "temporal.api.enums.v1.ArchivalState"
      optional :history_archival_uri, :string, 11
      optional :visibility_archival_state, :enum, 12, "temporal.api.enums.v1.ArchivalState"
      optional :visibility_archival_uri, :string, 13
    end
    add_message "temporal.api.workflowservice.v1.RegisterNamespaceResponse" do
    end
    add_message "temporal.api.workflowservice.v1.ListNamespacesRequest" do
      optional :page_size, :int32, 1
      optional :next_page_token, :bytes, 2
    end
    add_message "temporal.api.workflowservice.v1.ListNamespacesResponse" do
      repeated :namespaces, :message, 1, "temporal.api.workflowservice.v1.DescribeNamespaceResponse"
      optional :next_page_token, :bytes, 2
    end
    add_message "temporal.api.workflowservice.v1.DescribeNamespaceRequest" do
      optional :name, :string, 1
      optional :id, :string, 2
    end
    add_message "temporal.api.workflowservice.v1.DescribeNamespaceResponse" do
      optional :namespace_info, :message, 1, "temporal.api.namespace.v1.NamespaceInfo"
      optional :config, :message, 2, "temporal.api.namespace.v1.NamespaceConfig"
      optional :replication_config, :message, 3, "temporal.api.replication.v1.NamespaceReplicationConfig"
      optional :failover_version, :int64, 4
      optional :is_global_namespace, :bool, 5
    end
    add_message "temporal.api.workflowservice.v1.UpdateNamespaceRequest" do
      optional :name, :string, 1
      optional :update_info, :message, 2, "temporal.api.namespace.v1.UpdateNamespaceInfo"
      optional :config, :message, 3, "temporal.api.namespace.v1.NamespaceConfig"
      optional :replication_config, :message, 4, "temporal.api.replication.v1.NamespaceReplicationConfig"
      optional :security_token, :string, 5
      optional :delete_bad_binary, :string, 6
    end
    add_message "temporal.api.workflowservice.v1.UpdateNamespaceResponse" do
      optional :namespace_info, :message, 1, "temporal.api.namespace.v1.NamespaceInfo"
      optional :config, :message, 2, "temporal.api.namespace.v1.NamespaceConfig"
      optional :replication_config, :message, 3, "temporal.api.replication.v1.NamespaceReplicationConfig"
      optional :failover_version, :int64, 4
      optional :is_global_namespace, :bool, 5
    end
    add_message "temporal.api.workflowservice.v1.DeprecateNamespaceRequest" do
      optional :name, :string, 1
      optional :security_token, :string, 2
    end
    add_message "temporal.api.workflowservice.v1.DeprecateNamespaceResponse" do
    end
    add_message "temporal.api.workflowservice.v1.StartWorkflowExecutionRequest" do
      optional :namespace, :string, 1
      optional :workflow_id, :string, 2
      optional :workflow_type, :message, 3, "temporal.api.common.v1.WorkflowType"
      optional :task_queue, :message, 4, "temporal.api.taskqueue.v1.TaskQueue"
      optional :input, :message, 5, "temporal.api.common.v1.Payloads"
      optional :workflow_execution_timeout, :message, 6, "google.protobuf.Duration"
      optional :workflow_run_timeout, :message, 7, "google.protobuf.Duration"
      optional :workflow_task_timeout, :message, 8, "google.protobuf.Duration"
      optional :identity, :string, 9
      optional :request_id, :string, 10
      optional :workflow_id_reuse_policy, :enum, 11, "temporal.api.enums.v1.WorkflowIdReusePolicy"
      optional :retry_policy, :message, 12, "temporal.api.common.v1.RetryPolicy"
      optional :cron_schedule, :string, 13
      optional :memo, :message, 14, "temporal.api.common.v1.Memo"
      optional :search_attributes, :message, 15, "temporal.api.common.v1.SearchAttributes"
      optional :header, :message, 16, "temporal.api.common.v1.Header"
    end
    add_message "temporal.api.workflowservice.v1.StartWorkflowExecutionResponse" do
      optional :run_id, :string, 1
    end
    add_message "temporal.api.workflowservice.v1.GetWorkflowExecutionHistoryRequest" do
      optional :namespace, :string, 1
      optional :execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
      optional :maximum_page_size, :int32, 3
      optional :next_page_token, :bytes, 4
      optional :wait_new_event, :bool, 5
      optional :history_event_filter_type, :enum, 6, "temporal.api.enums.v1.HistoryEventFilterType"
      optional :skip_archival, :bool, 7
    end
    add_message "temporal.api.workflowservice.v1.GetWorkflowExecutionHistoryResponse" do
      optional :history, :message, 1, "temporal.api.history.v1.History"
      repeated :raw_history, :message, 2, "temporal.api.common.v1.DataBlob"
      optional :next_page_token, :bytes, 3
      optional :archived, :bool, 4
    end
    add_message "temporal.api.workflowservice.v1.PollWorkflowTaskQueueRequest" do
      optional :namespace, :string, 1
      optional :task_queue, :message, 2, "temporal.api.taskqueue.v1.TaskQueue"
      optional :identity, :string, 3
      optional :binary_checksum, :string, 4
    end
    add_message "temporal.api.workflowservice.v1.PollWorkflowTaskQueueResponse" do
      optional :task_token, :bytes, 1
      optional :workflow_execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
      optional :workflow_type, :message, 3, "temporal.api.common.v1.WorkflowType"
      optional :previous_started_event_id, :int64, 4
      optional :started_event_id, :int64, 5
      optional :attempt, :int32, 6
      optional :backlog_count_hint, :int64, 7
      optional :history, :message, 8, "temporal.api.history.v1.History"
      optional :next_page_token, :bytes, 9
      optional :query, :message, 10, "temporal.api.query.v1.WorkflowQuery"
      optional :workflow_execution_task_queue, :message, 11, "temporal.api.taskqueue.v1.TaskQueue"
      optional :scheduled_time, :message, 12, "google.protobuf.Timestamp"
      optional :started_time, :message, 13, "google.protobuf.Timestamp"
      map :queries, :string, :message, 14, "temporal.api.query.v1.WorkflowQuery"
    end
    add_message "temporal.api.workflowservice.v1.RespondWorkflowTaskCompletedRequest" do
      optional :task_token, :bytes, 1
      repeated :commands, :message, 2, "temporal.api.command.v1.Command"
      optional :identity, :string, 3
      optional :sticky_attributes, :message, 4, "temporal.api.taskqueue.v1.StickyExecutionAttributes"
      optional :return_new_workflow_task, :bool, 5
      optional :force_create_new_workflow_task, :bool, 6
      optional :binary_checksum, :string, 7
      map :query_results, :string, :message, 8, "temporal.api.query.v1.WorkflowQueryResult"
    end
    add_message "temporal.api.workflowservice.v1.RespondWorkflowTaskCompletedResponse" do
      optional :workflow_task, :message, 1, "temporal.api.workflowservice.v1.PollWorkflowTaskQueueResponse"
    end
    add_message "temporal.api.workflowservice.v1.RespondWorkflowTaskFailedRequest" do
      optional :task_token, :bytes, 1
      optional :cause, :enum, 2, "temporal.api.enums.v1.WorkflowTaskFailedCause"
      optional :failure, :message, 3, "temporal.api.failure.v1.Failure"
      optional :identity, :string, 4
      optional :binary_checksum, :string, 5
    end
    add_message "temporal.api.workflowservice.v1.RespondWorkflowTaskFailedResponse" do
    end
    add_message "temporal.api.workflowservice.v1.PollActivityTaskQueueRequest" do
      optional :namespace, :string, 1
      optional :task_queue, :message, 2, "temporal.api.taskqueue.v1.TaskQueue"
      optional :identity, :string, 3
      optional :task_queue_metadata, :message, 4, "temporal.api.taskqueue.v1.TaskQueueMetadata"
    end
    add_message "temporal.api.workflowservice.v1.PollActivityTaskQueueResponse" do
      optional :task_token, :bytes, 1
      optional :workflow_namespace, :string, 2
      optional :workflow_type, :message, 3, "temporal.api.common.v1.WorkflowType"
      optional :workflow_execution, :message, 4, "temporal.api.common.v1.WorkflowExecution"
      optional :activity_type, :message, 5, "temporal.api.common.v1.ActivityType"
      optional :activity_id, :string, 6
      optional :header, :message, 7, "temporal.api.common.v1.Header"
      optional :input, :message, 8, "temporal.api.common.v1.Payloads"
      optional :heartbeat_details, :message, 9, "temporal.api.common.v1.Payloads"
      optional :scheduled_time, :message, 10, "google.protobuf.Timestamp"
      optional :current_attempt_scheduled_time, :message, 11, "google.protobuf.Timestamp"
      optional :started_time, :message, 12, "google.protobuf.Timestamp"
      optional :attempt, :int32, 13
      optional :schedule_to_close_timeout, :message, 14, "google.protobuf.Duration"
      optional :start_to_close_timeout, :message, 15, "google.protobuf.Duration"
      optional :heartbeat_timeout, :message, 16, "google.protobuf.Duration"
      optional :retry_policy, :message, 17, "temporal.api.common.v1.RetryPolicy"
    end
    add_message "temporal.api.workflowservice.v1.RecordActivityTaskHeartbeatRequest" do
      optional :task_token, :bytes, 1
      optional :details, :message, 2, "temporal.api.common.v1.Payloads"
      optional :identity, :string, 3
    end
    add_message "temporal.api.workflowservice.v1.RecordActivityTaskHeartbeatResponse" do
      optional :cancel_requested, :bool, 1
    end
    add_message "temporal.api.workflowservice.v1.RecordActivityTaskHeartbeatByIdRequest" do
      optional :namespace, :string, 1
      optional :workflow_id, :string, 2
      optional :run_id, :string, 3
      optional :activity_id, :string, 4
      optional :details, :message, 5, "temporal.api.common.v1.Payloads"
      optional :identity, :string, 6
    end
    add_message "temporal.api.workflowservice.v1.RecordActivityTaskHeartbeatByIdResponse" do
      optional :cancel_requested, :bool, 1
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskCompletedRequest" do
      optional :task_token, :bytes, 1
      optional :result, :message, 2, "temporal.api.common.v1.Payloads"
      optional :identity, :string, 3
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskCompletedResponse" do
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskCompletedByIdRequest" do
      optional :namespace, :string, 1
      optional :workflow_id, :string, 2
      optional :run_id, :string, 3
      optional :activity_id, :string, 4
      optional :result, :message, 5, "temporal.api.common.v1.Payloads"
      optional :identity, :string, 6
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskCompletedByIdResponse" do
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskFailedRequest" do
      optional :task_token, :bytes, 1
      optional :failure, :message, 2, "temporal.api.failure.v1.Failure"
      optional :identity, :string, 3
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskFailedResponse" do
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskFailedByIdRequest" do
      optional :namespace, :string, 1
      optional :workflow_id, :string, 2
      optional :run_id, :string, 3
      optional :activity_id, :string, 4
      optional :failure, :message, 5, "temporal.api.failure.v1.Failure"
      optional :identity, :string, 6
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskFailedByIdResponse" do
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskCanceledRequest" do
      optional :task_token, :bytes, 1
      optional :details, :message, 2, "temporal.api.common.v1.Payloads"
      optional :identity, :string, 3
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskCanceledResponse" do
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskCanceledByIdRequest" do
      optional :namespace, :string, 1
      optional :workflow_id, :string, 2
      optional :run_id, :string, 3
      optional :activity_id, :string, 4
      optional :details, :message, 5, "temporal.api.common.v1.Payloads"
      optional :identity, :string, 6
    end
    add_message "temporal.api.workflowservice.v1.RespondActivityTaskCanceledByIdResponse" do
    end
    add_message "temporal.api.workflowservice.v1.RequestCancelWorkflowExecutionRequest" do
      optional :namespace, :string, 1
      optional :workflow_execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
      optional :identity, :string, 3
      optional :request_id, :string, 4
      optional :first_execution_run_id, :string, 5
    end
    add_message "temporal.api.workflowservice.v1.RequestCancelWorkflowExecutionResponse" do
    end
    add_message "temporal.api.workflowservice.v1.SignalWorkflowExecutionRequest" do
      optional :namespace, :string, 1
      optional :workflow_execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
      optional :signal_name, :string, 3
      optional :input, :message, 4, "temporal.api.common.v1.Payloads"
      optional :identity, :string, 5
      optional :request_id, :string, 6
      optional :control, :string, 7
    end
    add_message "temporal.api.workflowservice.v1.SignalWorkflowExecutionResponse" do
    end
    add_message "temporal.api.workflowservice.v1.SignalWithStartWorkflowExecutionRequest" do
      optional :namespace, :string, 1
      optional :workflow_id, :string, 2
      optional :workflow_type, :message, 3, "temporal.api.common.v1.WorkflowType"
      optional :task_queue, :message, 4, "temporal.api.taskqueue.v1.TaskQueue"
      optional :input, :message, 5, "temporal.api.common.v1.Payloads"
      optional :workflow_execution_timeout, :message, 6, "google.protobuf.Duration"
      optional :workflow_run_timeout, :message, 7, "google.protobuf.Duration"
      optional :workflow_task_timeout, :message, 8, "google.protobuf.Duration"
      optional :identity, :string, 9
      optional :request_id, :string, 10
      optional :workflow_id_reuse_policy, :enum, 11, "temporal.api.enums.v1.WorkflowIdReusePolicy"
      optional :signal_name, :string, 12
      optional :signal_input, :message, 13, "temporal.api.common.v1.Payloads"
      optional :control, :string, 14
      optional :retry_policy, :message, 15, "temporal.api.common.v1.RetryPolicy"
      optional :cron_schedule, :string, 16
      optional :memo, :message, 17, "temporal.api.common.v1.Memo"
      optional :search_attributes, :message, 18, "temporal.api.common.v1.SearchAttributes"
      optional :header, :message, 19, "temporal.api.common.v1.Header"
    end
    add_message "temporal.api.workflowservice.v1.SignalWithStartWorkflowExecutionResponse" do
      optional :run_id, :string, 1
    end
    add_message "temporal.api.workflowservice.v1.ResetWorkflowExecutionRequest" do
      optional :namespace, :string, 1
      optional :workflow_execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
      optional :reason, :string, 3
      optional :workflow_task_finish_event_id, :int64, 4
      optional :request_id, :string, 5
    end
    add_message "temporal.api.workflowservice.v1.ResetWorkflowExecutionResponse" do
      optional :run_id, :string, 1
    end
    add_message "temporal.api.workflowservice.v1.TerminateWorkflowExecutionRequest" do
      optional :namespace, :string, 1
      optional :workflow_execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
      optional :reason, :string, 3
      optional :details, :message, 4, "temporal.api.common.v1.Payloads"
      optional :identity, :string, 5
      optional :first_execution_run_id, :string, 6
    end
    add_message "temporal.api.workflowservice.v1.TerminateWorkflowExecutionResponse" do
    end
    add_message "temporal.api.workflowservice.v1.ListOpenWorkflowExecutionsRequest" do
      optional :namespace, :string, 1
      optional :maximum_page_size, :int32, 2
      optional :next_page_token, :bytes, 3
      optional :start_time_filter, :message, 4, "temporal.api.filter.v1.StartTimeFilter"
      oneof :filters do
        optional :execution_filter, :message, 5, "temporal.api.filter.v1.WorkflowExecutionFilter"
        optional :type_filter, :message, 6, "temporal.api.filter.v1.WorkflowTypeFilter"
      end
    end
    add_message "temporal.api.workflowservice.v1.ListOpenWorkflowExecutionsResponse" do
      repeated :executions, :message, 1, "temporal.api.workflow.v1.WorkflowExecutionInfo"
      optional :next_page_token, :bytes, 2
    end
    add_message "temporal.api.workflowservice.v1.ListClosedWorkflowExecutionsRequest" do
      optional :namespace, :string, 1
      optional :maximum_page_size, :int32, 2
      optional :next_page_token, :bytes, 3
      optional :start_time_filter, :message, 4, "temporal.api.filter.v1.StartTimeFilter"
      oneof :filters do
        optional :execution_filter, :message, 5, "temporal.api.filter.v1.WorkflowExecutionFilter"
        optional :type_filter, :message, 6, "temporal.api.filter.v1.WorkflowTypeFilter"
        optional :status_filter, :message, 7, "temporal.api.filter.v1.StatusFilter"
      end
    end
    add_message "temporal.api.workflowservice.v1.ListClosedWorkflowExecutionsResponse" do
      repeated :executions, :message, 1, "temporal.api.workflow.v1.WorkflowExecutionInfo"
      optional :next_page_token, :bytes, 2
    end
    add_message "temporal.api.workflowservice.v1.ListWorkflowExecutionsRequest" do
      optional :namespace, :string, 1
      optional :page_size, :int32, 2
      optional :next_page_token, :bytes, 3
      optional :query, :string, 4
    end
    add_message "temporal.api.workflowservice.v1.ListWorkflowExecutionsResponse" do
      repeated :executions, :message, 1, "temporal.api.workflow.v1.WorkflowExecutionInfo"
      optional :next_page_token, :bytes, 2
    end
    add_message "temporal.api.workflowservice.v1.ListArchivedWorkflowExecutionsRequest" do
      optional :namespace, :string, 1
      optional :page_size, :int32, 2
      optional :next_page_token, :bytes, 3
      optional :query, :string, 4
    end
    add_message "temporal.api.workflowservice.v1.ListArchivedWorkflowExecutionsResponse" do
      repeated :executions, :message, 1, "temporal.api.workflow.v1.WorkflowExecutionInfo"
      optional :next_page_token, :bytes, 2
    end
    add_message "temporal.api.workflowservice.v1.ScanWorkflowExecutionsRequest" do
      optional :namespace, :string, 1
      optional :page_size, :int32, 2
      optional :next_page_token, :bytes, 3
      optional :query, :string, 4
    end
    add_message "temporal.api.workflowservice.v1.ScanWorkflowExecutionsResponse" do
      repeated :executions, :message, 1, "temporal.api.workflow.v1.WorkflowExecutionInfo"
      optional :next_page_token, :bytes, 2
    end
    add_message "temporal.api.workflowservice.v1.CountWorkflowExecutionsRequest" do
      optional :namespace, :string, 1
      optional :query, :string, 2
    end
    add_message "temporal.api.workflowservice.v1.CountWorkflowExecutionsResponse" do
      optional :count, :int64, 1
    end
    add_message "temporal.api.workflowservice.v1.GetSearchAttributesRequest" do
    end
    add_message "temporal.api.workflowservice.v1.GetSearchAttributesResponse" do
      map :keys, :string, :enum, 1, "temporal.api.enums.v1.IndexedValueType"
    end
    add_message "temporal.api.workflowservice.v1.RespondQueryTaskCompletedRequest" do
      optional :task_token, :bytes, 1
      optional :completed_type, :enum, 2, "temporal.api.enums.v1.QueryResultType"
      optional :query_result, :message, 3, "temporal.api.common.v1.Payloads"
      optional :error_message, :string, 4
      optional :worker_version_info, :message, 5, "temporal.api.version.v1.WorkerVersionInfo"
    end
    add_message "temporal.api.workflowservice.v1.RespondQueryTaskCompletedResponse" do
    end
    add_message "temporal.api.workflowservice.v1.ResetStickyTaskQueueRequest" do
      optional :namespace, :string, 1
      optional :execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
    end
    add_message "temporal.api.workflowservice.v1.ResetStickyTaskQueueResponse" do
    end
    add_message "temporal.api.workflowservice.v1.QueryWorkflowRequest" do
      optional :namespace, :string, 1
      optional :execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
      optional :query, :message, 3, "temporal.api.query.v1.WorkflowQuery"
      optional :query_reject_condition, :enum, 4, "temporal.api.enums.v1.QueryRejectCondition"
    end
    add_message "temporal.api.workflowservice.v1.QueryWorkflowResponse" do
      optional :query_result, :message, 1, "temporal.api.common.v1.Payloads"
      optional :query_rejected, :message, 2, "temporal.api.query.v1.QueryRejected"
    end
    add_message "temporal.api.workflowservice.v1.DescribeWorkflowExecutionRequest" do
      optional :namespace, :string, 1
      optional :execution, :message, 2, "temporal.api.common.v1.WorkflowExecution"
    end
    add_message "temporal.api.workflowservice.v1.DescribeWorkflowExecutionResponse" do
      optional :execution_config, :message, 1, "temporal.api.workflow.v1.WorkflowExecutionConfig"
      optional :workflow_execution_info, :message, 2, "temporal.api.workflow.v1.WorkflowExecutionInfo"
      repeated :pending_activities, :message, 3, "temporal.api.workflow.v1.PendingActivityInfo"
      repeated :pending_children, :message, 4, "temporal.api.workflow.v1.PendingChildExecutionInfo"
    end
    add_message "temporal.api.workflowservice.v1.DescribeTaskQueueRequest" do
      optional :namespace, :string, 1
      optional :task_queue, :message, 2, "temporal.api.taskqueue.v1.TaskQueue"
      optional :task_queue_type, :enum, 3, "temporal.api.enums.v1.TaskQueueType"
      optional :include_task_queue_status, :bool, 4
    end
    add_message "temporal.api.workflowservice.v1.DescribeTaskQueueResponse" do
      repeated :pollers, :message, 1, "temporal.api.taskqueue.v1.PollerInfo"
      optional :task_queue_status, :message, 2, "temporal.api.taskqueue.v1.TaskQueueStatus"
    end
    add_message "temporal.api.workflowservice.v1.GetClusterInfoRequest" do
    end
    add_message "temporal.api.workflowservice.v1.GetClusterInfoResponse" do
      optional :supported_sdk_versions, :message, 1, "temporal.api.version.v1.SupportedSDKVersions"
    end
    add_message "temporal.api.workflowservice.v1.ListTaskQueuePartitionsRequest" do
      optional :namespace, :string, 1
      optional :task_queue, :message, 2, "temporal.api.taskqueue.v1.TaskQueue"
    end
    add_message "temporal.api.workflowservice.v1.ListTaskQueuePartitionsResponse" do
      repeated :activity_task_queue_partitions, :message, 1, "temporal.api.taskqueue.v1.TaskQueuePartitionMetadata"
      repeated :workflow_task_queue_partitions, :message, 2, "temporal.api.taskqueue.v1.TaskQueuePartitionMetadata"
    end
  end
end

module Temporal
  module Api
    module WorkflowService
      module V1
        RegisterNamespaceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RegisterNamespaceRequest").msgclass
        RegisterNamespaceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RegisterNamespaceResponse").msgclass
        ListNamespacesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListNamespacesRequest").msgclass
        ListNamespacesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListNamespacesResponse").msgclass
        DescribeNamespaceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.DescribeNamespaceRequest").msgclass
        DescribeNamespaceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.DescribeNamespaceResponse").msgclass
        UpdateNamespaceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.UpdateNamespaceRequest").msgclass
        UpdateNamespaceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.UpdateNamespaceResponse").msgclass
        DeprecateNamespaceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.DeprecateNamespaceRequest").msgclass
        DeprecateNamespaceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.DeprecateNamespaceResponse").msgclass
        StartWorkflowExecutionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.StartWorkflowExecutionRequest").msgclass
        StartWorkflowExecutionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.StartWorkflowExecutionResponse").msgclass
        GetWorkflowExecutionHistoryRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.GetWorkflowExecutionHistoryRequest").msgclass
        GetWorkflowExecutionHistoryResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.GetWorkflowExecutionHistoryResponse").msgclass
        PollWorkflowTaskQueueRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.PollWorkflowTaskQueueRequest").msgclass
        PollWorkflowTaskQueueResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.PollWorkflowTaskQueueResponse").msgclass
        RespondWorkflowTaskCompletedRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondWorkflowTaskCompletedRequest").msgclass
        RespondWorkflowTaskCompletedResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondWorkflowTaskCompletedResponse").msgclass
        RespondWorkflowTaskFailedRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondWorkflowTaskFailedRequest").msgclass
        RespondWorkflowTaskFailedResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondWorkflowTaskFailedResponse").msgclass
        PollActivityTaskQueueRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.PollActivityTaskQueueRequest").msgclass
        PollActivityTaskQueueResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.PollActivityTaskQueueResponse").msgclass
        RecordActivityTaskHeartbeatRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RecordActivityTaskHeartbeatRequest").msgclass
        RecordActivityTaskHeartbeatResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RecordActivityTaskHeartbeatResponse").msgclass
        RecordActivityTaskHeartbeatByIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RecordActivityTaskHeartbeatByIdRequest").msgclass
        RecordActivityTaskHeartbeatByIdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RecordActivityTaskHeartbeatByIdResponse").msgclass
        RespondActivityTaskCompletedRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskCompletedRequest").msgclass
        RespondActivityTaskCompletedResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskCompletedResponse").msgclass
        RespondActivityTaskCompletedByIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskCompletedByIdRequest").msgclass
        RespondActivityTaskCompletedByIdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskCompletedByIdResponse").msgclass
        RespondActivityTaskFailedRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskFailedRequest").msgclass
        RespondActivityTaskFailedResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskFailedResponse").msgclass
        RespondActivityTaskFailedByIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskFailedByIdRequest").msgclass
        RespondActivityTaskFailedByIdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskFailedByIdResponse").msgclass
        RespondActivityTaskCanceledRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskCanceledRequest").msgclass
        RespondActivityTaskCanceledResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskCanceledResponse").msgclass
        RespondActivityTaskCanceledByIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskCanceledByIdRequest").msgclass
        RespondActivityTaskCanceledByIdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondActivityTaskCanceledByIdResponse").msgclass
        RequestCancelWorkflowExecutionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RequestCancelWorkflowExecutionRequest").msgclass
        RequestCancelWorkflowExecutionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RequestCancelWorkflowExecutionResponse").msgclass
        SignalWorkflowExecutionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.SignalWorkflowExecutionRequest").msgclass
        SignalWorkflowExecutionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.SignalWorkflowExecutionResponse").msgclass
        SignalWithStartWorkflowExecutionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.SignalWithStartWorkflowExecutionRequest").msgclass
        SignalWithStartWorkflowExecutionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.SignalWithStartWorkflowExecutionResponse").msgclass
        ResetWorkflowExecutionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ResetWorkflowExecutionRequest").msgclass
        ResetWorkflowExecutionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ResetWorkflowExecutionResponse").msgclass
        TerminateWorkflowExecutionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.TerminateWorkflowExecutionRequest").msgclass
        TerminateWorkflowExecutionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.TerminateWorkflowExecutionResponse").msgclass
        ListOpenWorkflowExecutionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListOpenWorkflowExecutionsRequest").msgclass
        ListOpenWorkflowExecutionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListOpenWorkflowExecutionsResponse").msgclass
        ListClosedWorkflowExecutionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListClosedWorkflowExecutionsRequest").msgclass
        ListClosedWorkflowExecutionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListClosedWorkflowExecutionsResponse").msgclass
        ListWorkflowExecutionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListWorkflowExecutionsRequest").msgclass
        ListWorkflowExecutionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListWorkflowExecutionsResponse").msgclass
        ListArchivedWorkflowExecutionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListArchivedWorkflowExecutionsRequest").msgclass
        ListArchivedWorkflowExecutionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListArchivedWorkflowExecutionsResponse").msgclass
        ScanWorkflowExecutionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ScanWorkflowExecutionsRequest").msgclass
        ScanWorkflowExecutionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ScanWorkflowExecutionsResponse").msgclass
        CountWorkflowExecutionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.CountWorkflowExecutionsRequest").msgclass
        CountWorkflowExecutionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.CountWorkflowExecutionsResponse").msgclass
        GetSearchAttributesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.GetSearchAttributesRequest").msgclass
        GetSearchAttributesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.GetSearchAttributesResponse").msgclass
        RespondQueryTaskCompletedRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondQueryTaskCompletedRequest").msgclass
        RespondQueryTaskCompletedResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.RespondQueryTaskCompletedResponse").msgclass
        ResetStickyTaskQueueRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ResetStickyTaskQueueRequest").msgclass
        ResetStickyTaskQueueResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ResetStickyTaskQueueResponse").msgclass
        QueryWorkflowRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.QueryWorkflowRequest").msgclass
        QueryWorkflowResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.QueryWorkflowResponse").msgclass
        DescribeWorkflowExecutionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.DescribeWorkflowExecutionRequest").msgclass
        DescribeWorkflowExecutionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.DescribeWorkflowExecutionResponse").msgclass
        DescribeTaskQueueRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.DescribeTaskQueueRequest").msgclass
        DescribeTaskQueueResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.DescribeTaskQueueResponse").msgclass
        GetClusterInfoRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.GetClusterInfoRequest").msgclass
        GetClusterInfoResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.GetClusterInfoResponse").msgclass
        ListTaskQueuePartitionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListTaskQueuePartitionsRequest").msgclass
        ListTaskQueuePartitionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("temporal.api.workflowservice.v1.ListTaskQueuePartitionsResponse").msgclass
      end
    end
  end
end
