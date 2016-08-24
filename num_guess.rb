number = rand(100) + 1
counter = 0

while counter < 5
    puts "What's your guess?"
    guess = gets.chomp.to_i
    if guess == number
        puts "Correct"
        exit
    else
        puts "No guess again"
        if guess < number
            puts "higher"
        else
            puts "lower"
        end
    end
    counter += 1
    puts "You have #{5 - counter} guesses left"
end

puts "You lose. The number was #{number}"
