Rails.application.routes.draw do
  root to: redirect('/software_engineer/welcome')

  get 'pokemon/index'
  get 'pokemon/big_count'
  get 'pokemon/by_word'
  get 'simple_count/letter_a'
  get 'simple_count/any_letter'
  get 'software_engineer/welcome'
  get 'software_engineer/questions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
