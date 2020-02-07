require 'test_helper'

class LetterCounterTest < ActiveSupport::TestCase
  test "can count a letter" do
    counter = LetterCounter.new('Bubble')
    assert_equal( 3, counter.count('b'), ['Bubble should have 3 bs.'] )
  end
end