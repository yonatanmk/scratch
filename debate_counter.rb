class Counter
  attr_accessor :count1, :count2, :count3, :count4, :count5, :count6, :count7, :count8, :count9, :count10, :count11, :count12, :count13, :count14

  def initialize
    @count1 = 0
    @count2 = 0
    @count3 = 0
    @count4 = 0
    @count5 = 0
    @count6 = 0
    @count7 = 0
    @count8 = 0
    @count9 = 0
    @count10 = 0
    @count11 = 0
    @count12 = 0
    @count13 = 0
    @count14 = 0
  end

  def display
    system "clear"
    puts "1. Every time Donald Trump refers to the success of one of his businesses or his negotiating acumen, drink"
    puts "Count: #{@count1}"
    puts "2. When Hillary Clinton directly or indirectly calls Trump a bigot or a racist or calls his supporters bigots or racists, drink. "
    puts "Count: #{@count2}"
    puts "3. If Donald Trump mentions Bill Clinton's affairs in the Oval Office, drink."
    puts "Count: #{@count3}"
    puts "4. When Hillary references Trump's bankruptcies or refers to his businesses as unsuccessful, drink."
    puts "Count: #{@count4}"
    puts "5. When Donald Trump uses the word HUGE drink."
    puts "Count: #{@count5}"
    puts "6. Every time Hillary Clinton mentions Barack Obama, drink."
    puts "Count: #{@count6}"
    puts "7. When Trump visibly reacts with a face of disbelief to something Hillary says, drink."
    puts "Count: #{@count7}"
    puts "8. When either candidate calls the other a liar or accuses the other of lying, drink. "
    puts "Count: #{@count8}"
    puts "9. When Trump mentions Hillary's emails, building his wall, or Benghazi drink."
    puts "Count: #{@count9}"
    puts "10. When Trump uses the word 'great' as in make America great, make great deals, or describes himself in this manner, drink. "
    puts "Count: #{@count10}"
    puts "11. If Hillary begins to cough and passes out, drink. "
    puts "Count: #{@count11}"
    puts "12. When Trump mentions a building he has built or his daughter, drink until the count of five."
    puts "Count: #{@count12}"
    puts "13. If Trump references Hillary's health, stamina or energy, drink."
    puts "Count: #{@count13}"
    puts "14. When Trump uses the word 'disaster' to refer to anything Hillary has done, drink."
    puts puts "Count: #{@count14}"
    gets
  end

end
#____________________________________________________
count = Counter.new

while true
  system "clear"
  puts "1. Every time Donald Trump refers to the success of one of his businesses or his negotiating acumen, drink"
  puts "Count: #{count.count1}"
  puts "2. When Hillary Clinton directly or indirectly calls Trump a bigot or a racist or calls his supporters bigots or racists, drink. "
  puts "Count: #{count.count2}"
  puts "3. If Donald Trump mentions Bill Clinton's affairs in the Oval Office, drink."
  puts "Count: #{count.count3}"
  puts "4. When Hillary references Trump's bankruptcies or refers to his businesses as unsuccessful, drink."
  puts "Count: #{count.count4}"
  puts "5. When Donald Trump uses the word HUGE drink."
  puts "Count: #{count.count5}"
  puts "6. Every time Hillary Clinton mentions Barack Obama, drink."
  puts "Count: #{count.count6}"
  puts "7. When Trump visibly reacts with a face of disbelief to something Hillary says, drink."
  puts "Count: #{count.count7}"
  puts "8. When either candidate calls the other a liar or accuses the other of lying, drink. "
  puts "Count: #{count.count8}"
  puts "9. When Trump mentions Hillary's emails, building his wall, or Benghazi drink."
  puts "Count: #{count.count9}"
  puts "10. When Trump uses the word 'great' as in make America great, make great deals, or describes himself in this manner, drink. "
  puts "Count: #{count.count10}"
  puts "11. If Hillary begins to cough and passes out, drink. "
  puts "Count: #{count.count11}"
  puts "12. When Trump mentions a building he has built or his daughter, drink until the count of five."
  puts "Count: #{count.count12}"
  puts "13. If Trump references Hillary's health, stamina or energy, drink."
  puts "Count: #{count.count13}"
  puts "14. When Trump uses the word 'disaster' to refer to anything Hillary has done, drink."
  puts "Count: #{count.count14}"
  act = gets.chomp.downcase

  if act == "1"
  count.count1 += 1
  puts "1: The count is now #{count.count1}"
  gets
  elsif act == "2"
  count.count2 += 1
  puts "2: The count is now #{count.count2}"
  gets
  elsif act == "3"
  count.count3 += 1
  puts "3: The count is now #{count.count3}"
  gets
  elsif act == "4"
  count.count4 += 1
  puts "4: The count is now #{count.count4}"
  gets
  elsif act == "5"
  count.count5 += 1
  puts "5: The count is now #{count.count5}"
  gets
  elsif act == "6"
  count.count6 += 1
  puts "6: The count is now #{count.count6}"
  gets
  elsif act == "7"
  count.count7 += 1
  puts "7: The count is now #{count.count7}"
  gets
  elsif act == "8"
  count.count8 += 1
  puts "8: The count is now #{count.count8}"
  gets
  elsif act == "9"
  count.count9 += 1
  puts "9: The count is now #{count.count9}"
  gets
  elsif act == "10"
  count.count10 += 1
  puts "10: The count is now #{count.count10}"
  gets
  elsif act == "11"
  count.count11 += 1
  puts "11: The count is now #{count.count11}"
  gets
  elsif act == "12"
  count.count12 += 1
  puts "12: The count is now #{count.count12}"
  gets
  elsif act == "13"
  count.count13 += 1
  puts "13: The count is now #{count.count13}"
  gets
  elsif act == "14"
  count.count14 += 1
  puts "14: The count is now #{count.count14}"
  gets
  elsif act == "1-"
  count.count1 -= 1
  puts "1: The count is now #{count.count1}"
  gets
  elsif act == "2-"
    count.count2 -= 1
    puts "2: The count is now #{count.count2}"
    gets
  elsif act == "3-"
    count.count3 -= 1
    puts "3: The count is now #{count.count3}"
    gets
  elsif act == "4-"
    count.count4 -= 1
    puts "4: The count is now #{count.count4}"
    gets
  elsif act == "5-"
    count.count5 -= 1
    puts "5: The count is now #{count.count5}"
    gets
  elsif act == "6-"
    count.count6 -= 1
    puts "6: The count is now #{count.count6}"
    gets
  elsif act == "7-"
    count.count7 -= 1
    puts "7: The count is now #{count.count7}"
    gets
  elsif act == "8-"
    count.count8 -= 1
    puts "8: The count is now #{count.count8}"
    gets
  elsif act == "9-"
    count.count9 -= 1
    puts "9: The count is now #{count.count9}"
    gets
  elsif act == "10-"
    count.count10 -= 1
    puts "10: The count is now #{count.count10}"
    gets
  elsif act == "11-"
    count.count11 -= 1
    puts "11: The count is now #{count.count11}"
    gets
  elsif act == "12-"
    count.count12 -= 1
    puts "12: The count is now #{count.count12}"
    gets
  elsif act == "13-"
    count.count13 -= 1
    puts "13: The count is now #{count.count13}"
    gets
  elsif act == "14-"
    count.count14 -= 1
    puts "14: The count is now #{count.count14}"
    gets
  elsif act == "display"
    count.display
  elsif act == "exit"
    break
  end
end
