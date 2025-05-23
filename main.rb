# frozen_string_literal: true

MAX_NUMBER_THRESHOLD = 1000
CUSTOM_DELIMITER_FLAG = '//'

def add(numbers) # rubocop:disable Metrics
  return 0 if numbers == ''

  delimiters = [',', '\n']
  if numbers[0..1] == CUSTOM_DELIMITER_FLAG
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
    num = num <= MAX_NUMBER_THRESHOLD ? num : 0
    negative_numbers << num if num.negative?
    num
  end
  raise "negatives not allowed: #{negative_numbers.join(',')}" if negative_numbers.any?

  total
end
