# I like parentheticals (a lot).
# "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
#
# Write a function that, given a sentence like the one above, along with the position of an opening parenthesis,
# finds the corresponding closing parenthesis.
#
# Example: if the example string above is input with the number 10 (position of the first parenthesis), the output
# should be 79 (position of the last parenthesis).


def parens_matchON(input, index)
  parens = []
  pairs = []
  input.split("").each_with_index do |char, i|
    if char == "("
      parens.push(i)
    elsif char == ")"
      pairs.push([parens.pop(), i])
    end
    puts parens
  end
  puts pairs.find{|pair| pair[0] == index }[1]
end

# def parens_matchO1(input, index)
#   parens = 0
#   pairs = []
#   input.split("").each_with_index do |char, i|
#     if char == "("
#       parens += 1
#     elsif char == ")"
#       pairs.push([parens.pop(), i])
#     end
#   end
#   puts pairs.find{|pair| pair[0] == index }[1]
# end

input = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
parens_matchON(input, 28)
# parens_matchO1(input, 28)

# A stack is like a stack of plates. It's "last in, first out" (LIFO), which means the item that was put in the stack most recently is the first item that comes out.
#
#
# Stacks have two main methods:
#
# push() : adds an item
# pop() : removes and returns the top item
# They can also include some utility methods:
#
# peek() : returns the item on the top of the stack, without removing it.
# is_empty() : returns True if the stack is empty, False otherwise
