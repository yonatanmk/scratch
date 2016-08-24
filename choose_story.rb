puts "You’re a traveler on a long journey."
puts "After many miles, you come to a fork in the road. "
puts "To the North is a small village."
puts "To the East is dark cave."
puts "Which way do you go? North or East?"
puts

decision = 0

while decision == 0
    direction = gets.chomp.downcase
    if direction == "north"
        puts "Decide Later north"
        decision = 1
    elsif direction == "east"
        puts "Decide Later east"
        decision = 1
    else
        puts "Please decide if you want to go North or East. The other paths are blocked"
    end
end
