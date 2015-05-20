require_relative 'calculator'
require 'minitest'

class CalculatorTest < Minitest::Test
  # We started with very little guidance, we only knew:
  #
  # Build a calculator, it needs to do these things:
  # .new, #total, #add, #clear, #subtract
  #
  # From there, we thought about what would make sense for a calculator,
  # and we came up with the example we see below.
  #
  # We translated that into a test by putting an `assert_equal`
  # everywhere that we expected something to be true.
  def test_acceptance
    # starts at zero
    calc = Calculator.new
    assert_equal 0, calc.total

    # adding
    calc.add(5)
    assert_equal 5, calc.total
    calc.add(2)
    assert_equal 7, calc.total

    # clear
    calc.clear
    assert_equal 0, calc.total

    # subtract
    calc.subtract 5
    assert_equal -5, calc.total
    calc.subtract 2
    assert_equal -7, calc.total

    # one more for good measure :)
    calc.add 10
    assert_equal 3, calc.total
    calc.subtract 1
    assert_equal 2, calc.total
  end

  # After we had the above acceptance test, we described, in English,
  # what our calculator needed to do in order to pass that test.
  # We call it an "acceptance" test, because if it can do all that,
  # then my code is acceptable :)
  #
  # Then we replaced the spaces with underscores, added `def test_`
  # before each one... Now each one of our ideas is a test!
  # Since they're much more focused, we call them "unit" tests.
  # But we don't want them to run yet, so we added `skip` in the body
  # of each test.
  #
  # Then we ran the acceptance test to see how far it got.
  # When it would break, we looked to see which of our unit tests
  # would talk about it. Then we'd write that test, watch it fail,
  # and then write the code that makes it pass.
  #
  # This got us a little bit further in our acceptance test,
  # whatever it was failing on now told us what is the next test
  # we need to write.
  #
  # We repeated this cycle until all the unit tests were passing,
  # and as a consequence, it did everything it needed to do,
  # and the acceptance test passed too!

  def test_total_starts_at_zero
    assert_equal 0, Calculator.new.total
  end

  # If we'd had more time, I would have changed the calculator
  # to accept an initial total at this point.
  # This is because it's annoying to have to write all this setup code!
  def test_adding_increases_the_total_by_the_added_amount
    calc = Calculator.new

    calc.add 3
    assert_equal 3, calc.total

    calc.add 8
    assert_equal 11, calc.total
  end

  # Notice that in this one, we make an assertion both before and after
  # the `clear` method. This is to make sure the calculator looks the way we
  # think it does, before we make our assertion about how it should change.
  def test_clearing_sets_the_total_to_zero
    calc = Calculator.new
    calc.add 10

    assert_equal 10, calc.total
    calc.clear
    assert_equal 0, calc.total
  end

  def test_subtracting_decreases_the_total_by_the_subtracted_amount
    calc = Calculator.new
    calc.subtract 5
    assert_equal -5, calc.total
  end
end
