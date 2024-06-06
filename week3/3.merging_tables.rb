# frozen_string_literal: true

# Merging Tables Problem
def merge(n, m, td, merge_queries)
  output = []
  parent = Array.new(n) { |i| i }
  rank = Array.new(n, 0)
  max_table_size = td.max

  merge_queries.each do |query|
    destination = find(query[0] - 1, parent)
    source = find(query[1] - 1, parent)

    unless source == destination
      if rank[source] > rank[destination]
        parent[destination] = source
        td[source] += td[destination]
        td[destination] = 0
        max_table_size = [max_table_size, td[source]].max
      else
        parent[source] = destination
        td[destination] += td[source]
        td[source] = 0
        max_table_size = [max_table_size, td[destination]].max
        rank[destination] += 1 if rank[source] == rank[destination]
      end
    end
    output << max_table_size
  end

  output.join("\n")
end

def find(i, parent)
  if i != parent[i]
    parent[i] = find(parent[i], parent)
  end
  parent[i]
end

# Get Input
input = gets("\t\n").chomp.split("\n")
line1 = input[0].split.map(&:to_i)
n = line1[0]
m = line1[1]
tables_data = input[1].split.map(&:to_i)
merge_queries = []
(2...m + 2).each do |i|
  merge_queries << input[i].split.map(&:to_i)
end

# Main
print(merge(n, m, tables_data, merge_queries))
