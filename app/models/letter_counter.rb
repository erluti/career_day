class LetterCounter
  def initialize(word)
    @word = word
  end

  def count(letter)
    # return 800 # intentional bug to show tests
    @word.downcase.count(letter.downcase)
  end
end