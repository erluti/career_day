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
end
