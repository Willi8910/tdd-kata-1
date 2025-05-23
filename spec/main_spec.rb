# frozen_string_literal: true

require_relative '../main'

describe 'add' do # rubocop:disable Metrics/BlockLength
  context 'with blank string' do
    it 'should return 0' do
      expect(add('')).to eq(0)
    end
  end

  context 'with only one number' do
    it 'should return same number' do
      expect(add('1')).to eq(1)
    end
  end

  context 'with two numbers' do
    it 'should return sum of numbers' do
      expect(add('1,5')).to eq(6)
    end
  end

  context 'with numbers including newline' do
    it 'should return sum of numbers' do
      expect(add('1\n2,3')).to eq(6)
      expect(add('1\n2,3,4\n6')).to eq(16)
    end
  end

  context 'with custom delimiter' do
    it 'should return correct result' do
      expect(add('//;\n1;2')).to eq(3)
      expect(add('//__\n1__2__4')).to eq(7)
    end
  end

  context 'with huge amount of numbers' do
    it 'should return sum of numbers' do
      numbers = 100.times.map { rand(0..100) }
      expect(add(numbers.join(','))).to eq(numbers.sum)
    end
  end

  context 'with wrong params' do
    it 'should raise error' do
      expect { add('1.,') }.to raise_error('invalid value for Integer(): "1."')
    end
  end

  context 'with negative numbers' do
    it 'should raise errors' do
      expect{ add('1\n2,3,-4\n-6') }.to raise_error('negatives not allowed: -4,-6')
      expect{ add('//__\n1__2__-4') }.to raise_error('negatives not allowed: -4')
    end
  end
end
