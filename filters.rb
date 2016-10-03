def action_filter
  while true
  action = gets.chomp
    if action == "1"
      return "1"
    elsif action == "2"
      return "2"
    elsif action == "3"
    else
      puts "Please enter 1, 2, or 3."
    end
  end
end
