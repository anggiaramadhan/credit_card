class CreditCard
  attr_reader :code

  def initialize(params)
    @code = params
  end

  def call
    return unless code.is_a?(Integer)
    return if code.zero?

    return 'The number is valid' if divisible_by_ten?

    'The number is invalid'
  end

  private

  # step one
  # Double every second digit from right to left.
  # If this results in a two-digit number,
  # subtract 9 from it and get a single digit.
  # step two
  # add all single digit numbers from step 1
  def variable_one
    @variable_one ||= code.digits.select.with_index { |val, idx| idx.odd? }.map { |x| x * 2 }.map { |x| x > 9 ? x - 9 : x}.sum
  end

  # Add every digit in the odd places from right to left
  def variable_two
    @variable_two ||= code.digits.select.with_index { |val, idx| idx.even? }.sum
  end

  def sum_two_variable
    variable_one + variable_two
  end

  def divisible_by_ten?
    (sum_two_variable % 10).zero?
  end

end