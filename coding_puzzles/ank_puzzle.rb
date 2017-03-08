require 'pry'

def sentence_composer(input, dictionary, current_sentence = [], current_structure = [])
  output = []
  if input.length == 0
    if valid_sentence?(current_structure)
      return current_sentence.join(' ');
    else
      return nil
    end
  else
    dictionary.each do |word_type, words|
      words.each do |word|
        if input.start_with?(word)
          output << sentence_composer(input.slice(word.size..-1), dictionary, [*current_sentence, word], [*current_structure, word_type])
        end
      end
    end
  end
  return output.flatten.reject{|x| x.nil?}
end

def valid_sentence?(current_structure)
  return current_structure.include?(:verb) &&
    (current_structure.include?(:noun) ||
    current_structure.count(:article) >=2 )
end

dictionary = {
  noun: ["abcd", "c", "def", "h", "ij", "cde"],
  verb: ["bc", "fg", "g", "hij", "bcd"],
  article: ["a", "ac", "e"]
}
print sentence_composer("abcdefg", dictionary)
puts
print sentence_composer("abcc", dictionary)
puts
print sentence_composer("abcd", dictionary)
