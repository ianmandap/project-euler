module Timer
  def time_execution
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    yield

    finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    @runtime = finish_time - start_time
    puts "Problem computed in #{@runtime}s"
  end

  def puts_percentage(num, den)
    puts "#{(num.to_f / den * 100).round(2)}%"
  end
end
