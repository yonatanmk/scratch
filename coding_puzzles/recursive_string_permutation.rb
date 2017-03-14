# Write a recursive function for generating all permutations of an input string. Return them as a set.
# Don't worry about time or space complexity—if we wanted efficiency we'd write an iterative version.
#
# To start, assume every character in the input string is unique.
#
# Your function can have loops—it just needs to also be recursive.

def get_permutations(string)

  # base case
  if string.length <= 1
      return [string]
  end

  all_chars_except_last = string[0..-2]
  last_char = string[-1]

  # recursive call: get all possible permutations for all chars except last
  permutations_of_all_chars_except_last = get_permutations(all_chars_except_last)

  # put the last char in all possible positions for each of the above permutations
  permutations = []
  permutations_of_all_chars_except_last.each do |permutation_of_all_chars_except_last|
      (0..all_chars_except_last.length).each do |position|
          permutation = permutation_of_all_chars_except_last[0...position] + last_char + permutation_of_all_chars_except_last[position..-1]
          permutations << permutation                       #^^ exclusive
      end
  end

  return permutations
end

puts get_permutations('cat')

# Bonus
# How does the problem change if the string can have duplicate characters?
#
# What if we wanted to bring down the time and/or space costs?
#
# What We Learned
# This is one where playing with a sample input is huge. Sometimes it helps to think
# of algorithm design as a two-part process: first figure out how you would solve the problem
# "by hand," as though the input was a stack of paper on a desk in front of you. Then translate
# that process into code.
