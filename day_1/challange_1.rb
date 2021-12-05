file = File.open('input.txt')
data = file.read.split("\n")

# chunks = data.each_slice(3)

def compare_the_pair(array)
  counter = 0

  array.each_with_index do |num, index|
    next if index + 1 == array.length

    next_num = array[index + 1]
    counter += 1 if num < next_num
  end

  return counter
end

summed_chunks =
  data.each_with_index.map do |x, i|
    x + data[i + 1] + data[i + 2] if i < data.length - 2
  end
summed_chunks = summed_chunks.compact

print('Part 1: ' + (compare_the_pair(data).to_s) + "\n")

print('Part 2: ' + (compare_the_pair(summed_chunks).to_s))
