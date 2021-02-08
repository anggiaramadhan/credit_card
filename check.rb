#!/usr/bin/env ruby

require './credit_card'

input = ARGV.first.to_i
result = CreditCard.new(input).call

puts "#{result}"
