class Pokemon < ApplicationRecord
  def image_path(external_url:false)
    if external_url
      return self.external_url unless self.external_url.nil?
      self.external_url = PokemonFetcher.new.image_url(self.name) || 'not found'
      save!
      self.external_url
    else
      PokemonFetcher.new.image_path(self.name)
    end
  end
end
