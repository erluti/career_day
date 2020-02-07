require 'net/http'
require 'json'

class PokemonFetcher
  def initialize
    @base_uri = 'https://pokeapi.co/api/v2/pokemon'
  end

  def all_pokemon_names
    res = Net::HTTP.get_response(URI("#{@base_uri}?limit=1000"))
    raise "Failed with #{res.class}!!" unless res.is_a?(Net::HTTPSuccess)
    JSON.parse(res.body)['results'].collect{ |element| element['name'] }
  end
end
