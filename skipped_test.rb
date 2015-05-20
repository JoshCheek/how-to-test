require 'minitest'

class SkippedTest < Minitest::Test
  def test_it_skips
    skip
  end
end
