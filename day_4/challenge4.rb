require 'pp'

file = File.open('input.txt')
input = file.read.split("\n")

calls = input.shift.split(",")

bingo_cards = input.map{|x| x.split(" ")}
    .reject(&:empty?)
    .each_slice(5)

def winningRow?(row, calls)
    row.all? { |num| calls.include?(num)}
end

def winningCard?(card, calls)
    card.any? { |row| winningRow?(row, calls)} ||
    card.transpose.any? { |row| winningRow?(row, calls)}
end

def calculateScore(card, calls)
    
    sum = card.flatten().filter{|x| !calls.include?(x)}.map{|x| x.to_i}.sum()
  
    print(sum * calls.last.to_i)

end

(1..calls.length).each do |idx|
    current_calls = calls.take(idx)
    bingo_cards.each do |card|
        if (winningCard?(card, current_calls))
            score = calculateScore(card, current_calls)
            puts (score)
            return
        end
    end
end
