require 'rspec'
require_relative './roman_number.rb'

describe RomanNumber do

  describe 'initialize' do

    it 'should set value' do
      rn = RomanNumber.new('I')
      rn.value.should eq 'I'
    end

  end

  describe 'sum' do

    it 'should return II when adding I and I' do
      i = RomanNumber.new('I')
      result = i.add i
      result.should eq RomanNumber.new('II')
    end

  end
    
end
