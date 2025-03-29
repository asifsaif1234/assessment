# require 'spec_helper'
require_relative '../lib/calculator'

RSpec.describe Calculator do

  describe '#add' do
    let(:calculator) { Calculator.new }

    it 'returns 0 for when passing empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number when a #single number string' do
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns the sum for #two comma (,) separated numbers' do
      expect(calculator.add('1,5')).to eq(6)
    end

    it 'handles #any_amount of comma (,) separated numbers' do
      expect(calculator.add('1,2,3,4')).to eq(10)
    end

    it 'handles #new_lines between numbers (instead of commas).' do
      expect(calculator.add("1\n2,\n3")).to eq(6)
    end

    it 'handles // #delimiter' do
      expect(calculator.add('//;\n1;2')).to eq(3)
    end

    it 'throws an exception for a #single_negative_number' do
      expect { calculator.add('1,-2') }.to raise_error('negative numbers not allowed -2')
    end

    it 'throws an exception when #all_negative_numbers' do
      expect { calculator.add('1,-2,-3,4') }.to raise_error('negative numbers not allowed -2, -3')
    end

    it 'throws an exception when negatives with #custom_delimiter' do
      expect { calculator.add('//;\n1;-2;-3') }.to raise_error('negative numbers not allowed -2, -3')
    end

  end
end