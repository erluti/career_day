class SimpleCountController < ApplicationController
  def letter_a
    @reveal = params[:reveal] == 'true'
  end

  def any_letter
    # REVIEW make a "LetterCounter" class and show off tests?
    @letter = params[:letter]
    if @letter.present?
      @letter_count = 'pikachu'.count(@letter.downcase)
    else
      @letter = '?'
    end
  end
end
