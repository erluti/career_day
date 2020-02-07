require 'test_helper'

class PokemonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemon_index_url
    assert_response :success
  end

  test "should get big_count" do
    get pokemon_big_count_url
    assert_response :success
  end

end
