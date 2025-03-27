# require 'spec_helper'
require_relative '../lib/calculator'

RSpec.describe Calculator do

  describe '#add' do
    it 'returns 0 for when passing empty string' do
      calculator = Calculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number when a #single number string' do
      calculator = Calculator.new
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns the sum for #two comma (,) separated numbers' do
      calculator = Calculator.new
      expect(calculator.add('1,5')).to eq(6)
    end

    it 'handles #any_amount of comma (,) separated numbers' do
      calculator = Calculator.new
      expect(calculator.add('1,2,3,4')).to eq(10)
    end

    it 'handles #new_lines between numbers (instead of commas).' do
      calculator = Calculator.new
      expect(calculator.add("1\n2,\n3")).to eq(6)
    end

  end
end