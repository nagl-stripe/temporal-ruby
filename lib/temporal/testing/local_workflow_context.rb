require 'securerandom'
require 'temporal/testing/local_activity_context'
require 'temporal/testing/workflow_execution'
require 'temporal/execution_options'
require 'temporal/metadata/activity'
require 'temporal/workflow/future'
require 'temporal/workflow/history/event_target'
require 'temporal/workflow/context_helpers'

module Temporal
  module Testing
    class LocalWorkflowContext
      attr_reader :metadata, :config

      def initialize(execution, workflow_id, run_id, disabled_releases, metadata, config = Temporal.configuration)
        @last_event_id = 0
        @execution = execution
        @run_id = run_id
        @workflow_id = workflow_id
        @disabled_releases = disabled_releases
        @metadata = metadata
        @completed = false
        @config = config
      end

      def completed?
        @completed
      end

      def logger
        Temporal.logger
      end

      def headers
        metadata.headers
      end

      def has_release?(change_name)
        !disabled_releases.include?(change_name.to_s)
      end

      def execute_activity(activity_class, *input, **args)
        options = args.delete(:options) || {}
        input << args unless args.empty?

        event_id = next_event_id
        activity_id = options[:activity_id] || event_id

        target = Workflow::History::EventTarget.new(event_id, Workflow::History::EventTarget::ACTIVITY_TYPE)
        future = Workflow::Future.new(target, self, cancelation_id: activity_id)

        execution_options = ExecutionOptions.new(activity_class, options, config.default_execution_options)
        metadata = Metadata::Activity.new(
          namespace: execution_options.namespace,
          id: activity_id,
          name: execution_options.name,
          task_token: nil,
          attempt: 1,
          workflow_run_id: run_id,
          workflow_id: workflow_id,
          workflow_name: self.metadata.name,
          headers: execution_options.headers,
          heartbeat_details: nil,
          scheduled_at: Time.now,
          current_attempt_scheduled_at: Time.now,
        )
        context = LocalActivityContext.new(metadata)

        begin
          result = activity_class.execute_in_context(context, input)
        rescue StandardError => e
          # Capture any failure from running the activity into the future
          # instead of raising immediately in order to match the behavior of
          # running against a Temporal server.
          future.fail(e)
        else
          if context.async?
            execution.register_future(context.async_token, future)
          else
            # Fulfill the future straight away for non-async activities
            future.set(result)
          end
        end

        future
      end

      def execute_activity!(activity_class, *input, **args)
        future = execute_activity(activity_class, *input, **args)
        result_or_exception = future.get

        raise result_or_exception if future.failed?

        result_or_exception
      end

      def execute_local_activity(activity_class, *input, **args)
        options = args.delete(:options) || {}
        input << args unless args.empty?

        execution_options = ExecutionOptions.new(activity_class, options, config.default_execution_options)
        activity_id = options[:activity_id] || SecureRandom.uuid
        metadata = Metadata::Activity.new(
          namespace: execution_options.namespace,
          id: activity_id,
          name: execution_options.name,
          task_token: nil,
          attempt: 1,
          workflow_run_id: run_id,
          workflow_id: workflow_id,
          workflow_name: self.metadata.name,
          headers: execution_options.headers,
          heartbeat_details: nil,
          scheduled_at: Time.now,
          current_attempt_scheduled_at: Time.now,
        )
        context = LocalActivityContext.new(metadata)

        activity_class.execute_in_context(context, input)
      end

      def execute_workflow(workflow_class, *input, **args)
        raise NotImplementedError, 'not yet available for testing'
      end

      def execute_workflow!(workflow_class, *input, **args)
        options = args.delete(:options) || {}
        input << args unless args.empty?

        execution = WorkflowExecution.new
        workflow_id = SecureRandom.uuid
        run_id = SecureRandom.uuid
        execution_options = ExecutionOptions.new(workflow_class, options, config.default_execution_options)

        child_metadata = Temporal::Metadata::Workflow.new(
          namespace: execution_options.namespace,
          id: workflow_id,
          name: execution_options.name, # Workflow class name
          run_id: run_id,
          parent_id: @workflow_id,
          parent_run_id: @run_id,
          attempt: 1,
          task_queue: execution_options.task_queue,
          headers: execution_options.headers,
          run_started_at: Time.now,
          memo: {},
        )
        context = Temporal::Testing::LocalWorkflowContext.new(
          execution, workflow_id, run_id, workflow_class.disabled_releases, child_metadata
        )

        workflow_class.execute_in_context(context, input)
      end

      def side_effect(&block)
        block.call
      end

      def sleep(timeout)
        ::Kernel.sleep timeout
      end

      def start_timer(timeout, timer_id = nil)
        raise NotImplementedError, 'not yet available for testing'
      end

      def cancel_timer(timer_id)
        raise NotImplementedError, 'not yet available for testing'
      end

      def complete(result = nil)
        completed!
        result
      end

      def fail(exception)
        completed!
        raise exception
      end

      def wait_for_all(*futures)
        futures.each(&:wait)

        return
      end

      def wait_for(*futures, &unblock_condition)
        if futures.empty? && unblock_condition.nil?
          raise 'You must pass either a future or an unblock condition block to wait_for'
        end

        while (futures.empty? || futures.none?(&:finished?)) && (!unblock_condition || !unblock_condition.call)
          Fiber.yield
        end

        return
      end

      def now
        Time.now
      end

      def on_signal(signal_name = nil, &block)
        raise NotImplementedError, 'Signals are not available when Temporal::Testing.local! is on'
      end

      def on_query(query, &block)
        raise NotImplementedError, 'Queries are not available when Temporal::Testing.local! is on'
      end

      def cancel_activity(activity_id)
        raise NotImplementedError, 'Cancel is not available when Temporal::Testing.local! is on'
      end

      def cancel(target, cancelation_id)
        raise NotImplementedError, 'Cancel is not available when Temporal::Testing.local! is on'
      end

      def signal_external_workflow(workflow, signal, workflow_id, run_id = nil, input = nil, namespace: nil, child_workflow_only: false)
        raise NotImplementedError, 'Signals are not available when Temporal::Testing.local! is on'
      end

      def upsert_search_attributes(search_attributes)
        search_attributes = Temporal::Workflow::Context::Helpers.process_search_attributes(search_attributes)
        execution.upsert_search_attributes(search_attributes)
      end

      private

      attr_reader :execution, :run_id, :workflow_id, :disabled_releases

      def completed!
        @completed = true
      end

      def next_event_id
        @last_event_id += 1
        @last_event_id
      end
    end
  end
end
