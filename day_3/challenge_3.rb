file = File.open('input.txt')
data = file.read.split("\n")

# part 1
placements = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
gamma = Array.new

def final_bit(list, placment, gamma)
  one = 0
  zero = 0

  list.each { |x| x[placment] == '0' ? zero += 1 : one += 1 }
  zero > one ? gamma << 0 : gamma << 1
end

placements.map { |x| final_bit(data, x, gamma) }

epsilon = gamma.map { |x| 1 - x }

d_gamma = Integer(gamma.join.to_s, 2)
d_epsilon = Integer(epsilon.join.to_s, 2)

puts d_epsilon * d_gamma
