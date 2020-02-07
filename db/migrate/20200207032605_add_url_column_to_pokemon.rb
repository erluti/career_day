class AddUrlColumnToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :external_url, :string
  end
end
