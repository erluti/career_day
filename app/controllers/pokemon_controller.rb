class PokemonController < ApplicationController
  def index
    @names = Pokemon.pluck(:name)
  end

  def big_count
    # REVIEW make a "LetterCounter" class and show off tests?
    @letter = params[:letter]
    lower_letter = @letter.downcase
    @names = Pokemon.pluck(:name).select { |name| name.include?(lower_letter) }
    @letter_count = @names.sum {|name| name.count(lower_letter)}
  end

  def by_word
    @word = params[:word]
    if @word
      matcher = Regexp.new(@word.split('').join('.*'), 'i')
      @matches = Pokemon.all.select { |pokemon| pokemon.name =~ matcher }
    end
  end
end
