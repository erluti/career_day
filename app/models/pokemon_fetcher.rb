require 'net/http'
require 'json'

# This class is for consuming pokemon data from https://pokeapi.co/
class PokemonFetcher
  def initialize
    @base_uri = 'https://pokeapi.co/api/v2/pokemon'
  end

  def all_pokemon_names
    res = Net::HTTP.get_response(URI("#{@base_uri}?limit=1000"))
    raise "Failed with #{res.class}!!" unless res.is_a?(Net::HTTPSuccess)
    JSON.parse(res.body)['results'].collect{ |element| element['name'] }
  end

  def image_url(name)
    res = Net::HTTP.get_response(URI("#{@base_uri}/#{name}"))
    raise "Failed to get #{name} with #{res.class}!!" unless res.is_a?(Net::HTTPSuccess)
    image_url = JSON.parse(res.body)['sprites']['front_default']
  end

  # this approach fights the asset pipeline, but i used it in console to fill up the asset pipeline
  def image_path(name)
    image_path = "pokemon/#{name}.png"
    explicit_path = Rails.root.to_s + '/app/assets/images/' + image_path
    unless File.exist?(explicit_path)
      Rails.logger.info "Downloading image for '#{name}' and saving in '#{explicit_path}'."
      # get image location
      res = Net::HTTP.get_response(URI("#{@base_uri}/#{name}"))
      raise "Failed to get #{name} with #{res.class}!!" unless res.is_a?(Net::HTTPSuccess)
      image_url = JSON.parse(res.body)['sprites']['front_default']
      return 'whos_that_pokemon.png' unless image_url
      # get image for display
      res = Net::HTTP.get_response(URI(image_url))
      raise "Failed to get #{name} with #{res.class}!!" unless res.is_a?(Net::HTTPSuccess)
      open(explicit_path, "wb") do |file|
        file.write(res.body)
      end
    end
    image_path
  end
end
