module PokemonHelper
  # I used the PokemonFetcher in the console to get the external_urls populated and put all the images in the asset pipeline, so I'm commenting this out to use a version that access what I've cached.
  # def image_for(pokemon)
  #   image_url = pokemon.image_path(external_url: true)
  #   if image_url == 'not found'
  #     image_tag('whos_that_pokemon.png', width: 96)
  #   else
  #     tag(:img, src: image_url, width: 96)
  #   end
  # end

  def image_for(pokemon)
    if pokemon.external_url == 'not found'
      image_tag('whos_that_pokemon.png', width: 96)
    else
      image_tag("pokemon/#{pokemon.name}.png", width: 96)
    end
  end

  def emphasized_name(pokemon, word)
    name = pokemon.name.split('')
    letters = word.downcase.split('')
    capital = true
    emphasized_name = ""
    name.each do |letter|
      match = letter == letters.first

      if capital
        letter.upcase!
        capital = false
      elsif letter == '-'
        letter = ' '
        capital = true
      end

      if match
        emphasized_name += "<strong><u><mark>#{letter}</mark></u></strong>"
        letters.shift
      else
        emphasized_name += letter
      end
    end
    emphasized_name.html_safe
  end
end
