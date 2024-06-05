def parallel_processing(n, processing_times)
  threads = Array.new(n) { |i| [i, 0] }
  result = []

  processing_times.each do |job_time|
    thread_index, completion_time = threads.first
    result << [thread_index, completion_time]
    threads[0] = [thread_index, completion_time + job_time]
    sift_down(0, threads, n)
  end

  result
end


def sift_down(i, array, n)
  min_index = i
  l = 2 * i + 1
  r = 2 * i + 2

  min_index = l if l < n && array[l][1] <= array[min_index][1]
  min_index = r if r < n && array[r][1] <= array[min_index][1]
  min_index = l if l < n && r < n && array[l][1] <= array[min_index][1] && array[l][0] < array[r][0]

  if min_index != i
    array[i], array[min_index] = array[min_index], array[i]
    sift_down(min_index, array, n)
  end
end



# Example usage
n, m = gets.split.map(&:to_i)
processing_times = gets.split.map(&:to_i)

output = parallel_processing(n, processing_times)
output.each { |thread_index, start_time| puts "#{thread_index} #{start_time}" }
