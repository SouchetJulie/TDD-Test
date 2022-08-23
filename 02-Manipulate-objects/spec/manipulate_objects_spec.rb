# frozen_string_literal: true

# TO DO: Write the test that ensure:
# - Our array_to_hash method successfully converts an array to a hash, with the given pattern
# - Our palindrome? method successfully returns whether the given argument is a plindrome or not

require 'manipulate_objects'

describe '#array_to_hash' do
  it 'raises an error if the parameter is not an array' do
    # number
    begin
      expect(array_to_hash(1)).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    # string
    begin
      expect(array_to_hash('1')).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    # boolean
    begin
      expect(array_to_hash(true)).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    # hash
    begin
      expect(array_to_hash({ a: 'b' })).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
  end

  it 'raises an error if the array contains a number' do
    begin
      expect(array_to_hash([1])).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    begin
      expect(array_to_hash([1, 'a', 'b'])).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    begin
      expect(array_to_hash(['a', 1, 'b'])).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    begin
      expect(array_to_hash(['a', 'b', 1])).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
  end

  it 'raises an error if the array contains a boolean' do
    begin
      expect(array_to_hash([true])).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    begin
      expect(array_to_hash([true, 'a', 'b'])).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    begin
      expect(array_to_hash(['a', true, 'b'])).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
    begin
      expect(array_to_hash(['a', 'b', true])).to eq(false) # this fails the test
    rescue StandardError
      expect(true).to be(true) # if here, test succeeded
    end
  end

  it 'returns an empty hash if the array is empty' do
    expect(array_to_hash([])).to eq({})
  end

  it 'returns a hash' do
    expect(array_to_hash(%w[a b])).to be_a_kind_of(Hash)
  end

  it 'returns a hash whose keys are symbols' do
    expect(array_to_hash(%w[a b]).keys).to all(be_a(Symbol))
  end

  it 'returns a hash whose values are string' do
    values = array_to_hash(%w[a b]).values
    expect(values).to all(be_a(String))
  end

  it 'returns a hash that has the same values as the initial array' do
    array = %w[a b]
    expect(array_to_hash(array).values).to eq(array)
  end

  it 'returns a hash with incrementing "key<x>" keys with <x> matching the index in the array' do
    array = %w[a b]
    res = array_to_hash(array)
    keys = res.keys

    array.each_with_index do |element, index|
      key = keys[index]
      expect(key).to eq(:"key#{index}") # key matches
      expect(res[key]).to eq(element) # related value matches
    end
  end
end

describe '#palindrome?' do
  it 'raises an error when not given a string' do
    begin
      expect(palindrome?(1)).to eq(1) # fails the test
    rescue StandardError
      expect(true).to be(true) # succeeds the test
    end
    begin
      expect(palindrome?([])).to eq(1) # fails the test
    rescue StandardError
      expect(true).to be(true) # succeeds the test
    end
    begin
      expect(palindrome?({})).to eq(1) # fails the test
    rescue StandardError
      expect(true).to be(true) # succeeds the test
    end
  end

  it 'returns a boolean' do
    expect(palindrome?('test')).to be(true).or be(false)
  end

  it 'returns true if the word is a palindrome (case insensitive)' do
    expect(palindrome?('test')).to be(false)
    expect(palindrome?('tsest')).to be(true)
    expect(palindrome?('Tsest')).to be(true)
  end
end
