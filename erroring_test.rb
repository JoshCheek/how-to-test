require 'minitest'

class FailingTest < Minitest::Test
  def test_it_errors
    zomg_wtf_bbq
  end
end
