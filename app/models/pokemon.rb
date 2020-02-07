class Pokemon < ApplicationRecord
  def image_path
    PokemonFetcher.new.image_path(self.name)
  end
end
