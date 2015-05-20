require 'minitest'

class FailingTest < Minitest::Test
  def test_it_fails
    assert_equal 1, 2
  end
end
