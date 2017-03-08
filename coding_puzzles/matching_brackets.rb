# Given an expression string exp, examine whether the pairs and the orders of "{", "}", "(", ")", "[", "]" are correct in exp.
#
# For example, the program should return true for [()]{}{[()()]()} and false for [(]).

def matching_brackets(input)
  stack = []
  input.split("").each do |char|
    if char == "[" || char == "(" || char == "{"
      stack.push(char)
    elsif char == "]"
      return false if !stack.include?("[") || stack.last == "(" || stack.last == "{"
      max_index = 0
      stack.each_with_index do |val, i|
        if val == '['
          max_index = i
        end
      end
      stack.delete_at(max_index)
    elsif char == ")"
      return false if !stack.include?("(") || stack.last == "[" || stack.last == "{"
      max_index = 0
      stack.each_with_index do |val, i|
        if val == '('
          max_index = i
        end
      end
      stack.delete_at(max_index)
    elsif char == "}"
      return false if !stack.include?("{") || stack.last == "(" || stack.last == "["
      max_index = 0
      stack.each_with_index do |val, i|
        if val == '{'
          max_index = i
        end
      end
      stack.delete_at(max_index)
    end
  end

  if stack.length == 0
    return true
  else
    return false
  end
end

input = "[()]{}{[()()]()}"
puts matching_brackets(input)
input = "[(])"
puts matching_brackets(input)
