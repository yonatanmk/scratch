count = 0

while true
    puts "Say Something to Grandma!"
    speak = gets.chomp
    if speak == "BYE"
        count +=1
        if count == 3
            puts "I'VE ENJOYED OUR CONVERSATION! PlEASE VISIT SOME MORE! I'M SO LONELY!"
            break    
        else
            puts "THIS IS A LOVELY CONVERSATION!"
        end
    elsif speak == speak.upcase
        year = rand(1930.. 1981)
        puts "NO, NOT SINCE #{year}!"
        count = 0
    else
        puts "HUH?! SPEAK UP SONNY!"
        count = 0
    end
end
