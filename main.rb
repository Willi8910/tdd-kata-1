# frozen_string_literal: true

def add(numbers) # rubocop:disable Metrics
  return 0 if numbers == ''

  custom_delimiter_flag = '//'
  delimiter = ','
  if numbers[0..1] == custom_delimiter_flag
    splitted_numbers = numbers.split('\n')
    delimiter = splitted_numbers[0][2..]
    numbers = splitted_numbers[1]
  end

  negative_numbers = []
  total = numbers.split(delimiter).sum do |numpart|
    numpart.split('\n').sum do |n|
      num = Integer(n)
      negative_numbers << num if num.negative?
      num
    end
  end
  raise "negatives not allowed: #{negative_numbers.join(',')}" if negative_numbers.any?

  total
end
