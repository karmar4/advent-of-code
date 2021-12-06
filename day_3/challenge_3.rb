file = File.open('input.txt')
input = file.read.split("\n")

# part 1
placements = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
gamma = Array.new

def most_common_bit(data, placment)
  one = 0
  zero = 0
  data.each { |x| x[placment] == '0' ? zero += 1 : one += 1 }
  if zero > one
    most_common = 0
  elsif zero <= one
    most_common = 1
  end
end

placements.each do |pos|
  puts input.length
  if input.length == 1 
  print input
  end
  common_bit = most_common_bit(input, pos)
  input = input.filter {|x| x[pos].to_i == common_bit}

end

print input
puts Integer(input.join.to_s, 2)


# placements.map { |x| final_bit(data, x) }
# data = data.select{ |x| x[placment].to_i == most_common }


# epsilon = gamma.map { |x| 1 - x }

# d_gamma = Integer(gamma.join.to_s, 2)
# d_epsilon = Integer(epsilon.join.to_s, 2)

# puts d_epsilon * d_gamma

# part 2

oxygen_generator = ["110010000101",3205]
cO2_scrubber = ["000100011010", 282]
puts (3205 *282).to_s