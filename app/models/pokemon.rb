class Pokemon < ApplicationRecord
  def image_path(external_url:false)
    fetcher = PokemonFetcher.new
    if external_url
      fetcher.image_url(self.name)
    else
      fetcher.image_path(self.name)
    end
  end
end
