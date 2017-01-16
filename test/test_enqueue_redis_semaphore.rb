require_relative('./enqueue_tests')

class EnqueueRedisSemaphoreTest < MiniTest::Test
  include EnqueueTests

  def setup
    redis_reset
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    ActiveJob::Locking.options.adapter = ActiveJob::Locking::Adapters::RedisSemaphore
  end
end