class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        PokemonFetcher.new.all_pokemon_names.each do |name|
          Pokemon.create!(name: name)
        end
      end
    end
  end
end
