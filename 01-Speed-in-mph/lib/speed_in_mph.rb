# frozen_string_literal: true

# TO DO: write a method that takes a float as an argument and
# returns it converted from kph (km/h) to mph (mi/h)

def speed_in_mph(num)
  raise "Invalid number #{num}" unless num.is_a? Numeric

  # 1 km/h = 0.6213711922 mi/h
  (num * 0.6213711922).round(2)
end
