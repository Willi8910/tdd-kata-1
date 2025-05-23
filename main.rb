# frozen_string_literal: true

def add(numbers)
  return 0 if numbers == ''

  numbers.split(',').sum { |n| Integer(n)}
rescue StandardError
  0
end
