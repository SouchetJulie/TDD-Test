# frozen_string_literal: true

# BONUS ONLY: Write the array_to_hash and palindrome? methods

def array_to_hash(array)
  raise 'Invalid array' unless (array.is_a? Array) && (array.all? { |el| el.is_a? String })

  res = {}
  array.each_with_index { |el, i| res[:"key#{i}"] = el }

  res
end

def palindrome?(text)
  raise 'Invalid string' unless text.is_a? String

  is_palindrome = true
  middle = (text.length / 2).floor

  (0..middle).each do |index|
    letter = text[index]
    opposite = text[text.length - 1 - index]

    if letter.downcase != opposite.downcase
      is_palindrome = false
      break
    end
  end

  # all letters are mirrors : ✔
  is_palindrome
end
