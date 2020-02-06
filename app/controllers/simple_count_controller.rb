class SimpleCountController < ApplicationController
  def letter_a
    @reveal = params[:reveal]# == 'true'
  end

  def any_letter
  end
end
