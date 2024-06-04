# frozen_string_literal: true

# packets processing problem
def process(buffer_size, packets)
  return '' if buffer_size.zero? || packets.empty?

  queue = []
  result = []
  sum = 0
  packets.each_with_index do |packet, i|
    if queue.size >= buffer_size
      result << -1
    else
      if i.zero?
        sum = packet.sum
        queue <<  sum
        result << packet[0]
      else
        arrival_time = sum > packet[0] ? queue.last : packet[0]
        queue << arrival_time + packet[1]
        result << arrival_time
        sum = arrival_time + packet[1]
      end
    end
    queue.shift if i + 1 < packets.size && packets[i + 1][0] >= queue[0]
  end

  result
end


# input
input = gets("\t\n").chomp.split("\n")
input1 = input[0].split.map(&:to_i)
buffer_size = input1[0]
n = input1[1]
packets = []
(1..n).each do |i|
  packets << input[i].split.map(&:to_i)
end

puts process(buffer_size, packets)
