require 'test_helper'

class PokemonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemon_index_url
    assert_response :success
  end

  test "should get by_word" do
    get pokemon_by_word_url
    assert_response :success
  end

end
