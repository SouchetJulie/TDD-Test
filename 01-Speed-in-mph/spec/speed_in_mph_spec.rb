# frozen_string_literal: true

# TO DO: Write the specs that ensures our speed_in_mph method
# successfully converts speed from km/h to mi/h.
require 'speed_in_mph'

describe '#speed_in_mph' do
  it 'raises an error if the parameter is not a number' do
    # string
    begin
      expect(speed_in_mph('a')).to eq(false) # will fail the test
    rescue StandardError
      expect(true).to be(true) # the code must reach here to succeed the test
    end
    # boolean
    begin
      expect(speed_in_mph(true)).to eq(false) # will fail the test
    rescue StandardError
      expect(true).to be(true) # the code must reach here to succeed the test
    end
    # array
    begin
      expect(speed_in_mph([1])).to eq(false) # will fail the test
    rescue StandardError
      expect(true).to be(true) # the code must reach here to succeed the test
    end
    # hash
    begin
      expect(speed_in_mph({ a: '1' })).to eq(false) # will fail the test
    rescue StandardError
      expect(true).to be(true) # the code must reach here to succeed the test
    end
  end

  it 'returns the (positive, rounded) speed converted to mph, to 2 decimals' do
    expect(speed_in_mph(1)).to eq(0.62)
    expect(speed_in_mph(2)).to eq(1.24)
    expect(speed_in_mph(10)).to eq(6.21)
  end

  it 'returns the (negative, rounded) speed converted to mph, to 2 decimals' do
    expect(speed_in_mph(-1)).to eq(-0.62)
    expect(speed_in_mph(-2)).to eq(-1.24)
    expect(speed_in_mph(-10)).to eq(-6.21)
  end

  it 'returns the (positive, float) speed converted to mph, to 2 decimals' do
    expect(speed_in_mph(3.14)).to eq(1.95)
    expect(speed_in_mph(2.5)).to eq(1.55)
  end

  it 'returns the (negative, float) speed converted to mph, to 2 decimals' do
    expect(speed_in_mph(3.14)).to eq(1.95)
    expect(speed_in_mph(2.5)).to eq(1.55)
  end
end
