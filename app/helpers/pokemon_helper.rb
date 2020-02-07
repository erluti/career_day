module PokemonHelper
  def image_for(pokemon)
    image_url = pokemon.image_path(external_url: true)
    if image_url == 'not found'
      image_tag('whos_that_pokemon.png', width: 96)
    else
      tag(:img, src: image_url, width: 96)
    end
  end
end
