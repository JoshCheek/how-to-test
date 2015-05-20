require 'minitest'

class PassingTest < Minitest::Test
  def test_it_passes
    assert_equal 1, 1
  end
end
