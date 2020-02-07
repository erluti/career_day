class SimpleCountController < ApplicationController
  def letter_a
    @reveal = params[:reveal] == 'true'
  end

  def any_letter
    @word = 'Bulbasaur'
    @letter = params[:letter]
    if @letter.present?
      @letter_count = LetterCounter.new(@word).count(@letter)
    else
      @letter = '?'
    end
  end
end
