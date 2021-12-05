file = File.open('input.txt')
data = file.read.split("\n").map { |x| x.split(' ') }

horizontal = 0
aim = 0
depth = 0

data.each do |x|
  case x[0]
  when 'forward'
    horizontal += x[1].to_i
    depth += (aim * x[1].to_i)
  when 'down'
    aim += x[1].to_i
  when 'up'
    aim -= x[1].to_i
  else
    null
  end
end

puts 'aim' + aim.to_s
puts 'horizontal' + horizontal.to_s
puts 'depth' + depth.to_s

puts 'final: ' + (horizontal * depth).to_s
