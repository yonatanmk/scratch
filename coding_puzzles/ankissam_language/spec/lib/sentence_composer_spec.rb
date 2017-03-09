require "spec_helper"

RSpec.describe "Return_sentences" do
  let(:dictionary) do
    {
      noun: ["abcd", "c", "def", "h", "ij", "cde"],
      verb: ["bc", "fg", "g", "hij", "bcd"],
      article: ["a", "ac", "e"]
    }
  end

  it "returns empty when input doesnt use words from the dictionary" do
    expect(sentence_composer("abzcc", dictionary)).to eq([])
    expect(sentence_composer("abdefg", dictionary)).to eq([])
  end

  it "returns empty when input doesnt use verbs" do
    expect(sentence_composer("ceecij", dictionary)).to eq([])
  end

  it "returns empty when input verbs, no nouns or articles" do
    expect(sentence_composer("fgfgfggg", dictionary)).to eq([])
  end

  it "returns empty when input verbs, 1 article" do
    expect(sentence_composer("fgfgfggga", dictionary)).to eq([])
  end

  it "returns sentence when input has multiple verbs, 1 noun" do
    expect(sentence_composer("fgfgfgggc", dictionary)).to eq(["fg fg fg g g c"])
  end

  it "returns sentence when input has multiple verbs, 1 noun, 1 article" do
    expect(sentence_composer("fgfgfgggac", dictionary)).to eq(["fg fg fg g g a c"])
  end

  it "returns sentence when input has multiple verbs, 2 articles" do
    expect(sentence_composer("fgggae", dictionary)).to eq(["fg g g a e"])
  end

  it "returns multiple sentences with different number of nouns and articles" do
    expect(sentence_composer("fgggacac", dictionary)).to eq(
      [ "fg g g a c a c", "fg g g a c ac", "fg g g ac a c", "fg g g ac ac" ]
    )
  end

  it "correctly parses the given examples" do
    expect(sentence_composer("abcdefg", dictionary)).to eq(
      [ "abcd e fg", "a bc def g", "a bcd e fg" ]
    )

    expect(sentence_composer("abcc", dictionary)).to eq(["a bc c"])

    expect(sentence_composer("abcd", dictionary)).to eq([])
  end
end
