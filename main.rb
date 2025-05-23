# frozen_string_literal: true

def add(numbers) # rubocop:disable Metrics
  return 0 if numbers == ''

  max_number_threshold = 1000
  custom_delimiter_flag = '//'
  delimiters = [',', '\n']
  if numbers[0..1] == custom_delimiter_flag
    splitted_numbers = numbers.split('\n')
    delimiters = splitted_numbers[0][2..].split(']').map { |s| s[1..] }
    numbers = splitted_numbers[1]
  end

  negative_numbers = []
  arr_numbers = [numbers]
  delimiters.each do |delimiter|
    arr_numbers = arr_numbers.map { |number| number.split(delimiter) }.flatten
  end

  total = arr_numbers.sum do |n|
    num = Integer(n)
    num = num <= max_number_threshold ? num : 0
    negative_numbers << num if num.negative?
    num
  end
  raise "negatives not allowed: #{negative_numbers.join(',')}" if negative_numbers.any?

  total
end
