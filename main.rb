# frozen_string_literal: true

def add(numbers) # rubocop:disable Metrics/MethodLength
  return 0 if numbers == ''

  custom_delimiter_flag = '//'
  delimiter = ','
  if numbers[0..1] == custom_delimiter_flag
    splitted_numbers = numbers.split('\n')
    delimiter = splitted_numbers[0][2..]
    numbers = splitted_numbers[1]
  end

  numbers.split(delimiter).sum { |numpart| numpart.split('\n').sum { |n| Integer(n) } }
rescue StandardError
  0
end
