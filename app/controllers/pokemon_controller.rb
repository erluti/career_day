class PokemonController < ApplicationController
  def index
    @names = Pokemon.all.pluck(:name)
  end

  def big_count
    # REVIEW make a "LetterCounter" class and show off tests?
    @letter = params[:letter]
    lower_letter = @letter.downcase
    # REVIEW would like to have a "show them" button
    @letter_count = Pokemon.all.pluck('name').sum {|name| name.count(lower_letter)}
  end

  def by_word
    @word = params[:word]
    if @word
      matcher = Regexp.new(@word.split('').join('.*'))
      @matches = Pokemon.all.select { |pokemon| pokemon.name =~ matcher }
    end
  end
end
