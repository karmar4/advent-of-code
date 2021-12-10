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
    if bingo_cards.to_a.length == 1 && (winningCard?(bingo_cards.first, current_calls))
            pp bingo_cards.first
            calculateScore(bingo_cards.first, current_calls)
    break 
    else
        bingo_cards.each do |card|
            if (winningCard?(card, current_calls))
                bingo_cards = bingo_cards.reject{|c| c == card}
            end

        end
    end
end
