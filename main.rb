# frozen_string_literal: true

def add(numbers)
  return 0 if numbers == ''

  numbers.split(',').sum { |numpart| numpart.split('\n').sum { |n| Integer(n) }}
rescue StandardError
  0
end
