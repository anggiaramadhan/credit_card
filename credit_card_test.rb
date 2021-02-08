require "test/unit"
require_relative './credit_card'

class CreditCardTest < Test::Unit::TestCase
  def result(input)
    CreditCard.new(input).call
  end

  def valid_output
    'The number is valid'
  end

  def invalid_output
    'The number is invalid'
  end

  def test_input_is_integer
    input = 12_000_123

    assert(result(input).is_a?(String), 'Input was integer!')
  end

  def test_input_is_string
    input = '1233245'

    assert(result(input).nil?, 'Input was String!')
  end

  def test_zero_input
    input = 0

    assert(result(input).nil?, 'Input was zero value!')
  end

  def test_input_true
    input = 4556737586899855

    assert(result(input) == valid_output, 'Input was valid code!')
  end

  def test_input_false
    input = 4024007109022143

    assert(result(input) == invalid_output, 'Input was invalid code!')
  end
end