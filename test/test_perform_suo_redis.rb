require_relative('./perform_tests')

class PerformSuoRedisTest < MiniTest::Test
  include PerformTests

  def setup
    redis_reset
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    ActiveJob::Locking.options.adapter = ActiveJob::Locking::Adapters::SuoRedis
  end
end