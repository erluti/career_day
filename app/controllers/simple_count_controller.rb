class SimpleCountController < ApplicationController
  def letter_a
    @reveal = params[:reveal] == 'true'
  end

  def any_letter
    @letter = params[:letter]
    if @letter.present?
      @letter_count = 'pikachu'.count(@letter.downcase)
    else
      @letter = '?'
    end
  end
end
