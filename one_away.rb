#def one_away(string1, string2)
#  longest  = [string1, string2].max {|s| s.length}
#  shortest = [string1, string2].min {|s| s.length}
#
#  diff_count = 0
#
#  longest.chars.each_with_index do |char, index|
#    diff_count += 1 if char != shortest[index]
#  end
#
#  if diff_count > 1
#    false
#  else
#    true
#  end
#end

#Works!!
#def one_away(string1, string2)
#  first  = string1.chars
#  second = string2.chars
#
#  result = first - second
#
#  if result.length > 1
#    false
#  else
#    true
#  end
#end

def bumble_one_away(string1, string2)
  first  = string1.chars
  second = string2.chars

  result = set_of(first, second)
  puts result

  if result.length > 1
    false
  else
    true
  end
end

def difference_of(first, second)
  result = []

  first.each do |char|
    not_included = true

    second.each do |char_char|
      not_included = false if char == char_char
    end

    result << char if not_included
  end

  result
end

# the first answer from the book

def one_away(first, second)
  if first.length == second.length
    return replaced?(first, second)
  elsif first.length + 1 == second.length
    return insert?(first, second)
  elsif first.length == second.length + 1
    return insert?(second, first)
  end

  false
end

def insert?(string1, string2)
  index1 = 0
  index2 = 0

  while index1 < string1.length and index2 < string2.length
    if string1[index1] != string2[index2]
      return false if index1 != index2
      index2 += 1 # this part hangs me up a bit same as in the other
    else
      index1 += 1
      index2 += 1
    end
  end

  true
end

def replaced?(first, second)
  found_difference = false

  first.length.times do |n|
    if first[n] != second[n]
      return false if found_difference
      found_difference = true
    end
  end

  true
end

# second answer from the book

def all_in_one_away(string1, string2)
  return false if (string1.length - string2.length).abs > 1

  s1 = string1.length < string2.length ? string1 : string2
  s2 = string1.length < string2.length ? string2 : string1

  index1 = 0
  index2 = 0
  found_difference = false

  while index1 < s1.length and index2 < s2.length
    if s1[index1] != s2[index2]
      return false if found_difference
      found_difference = true

      if s1.length == s2.length
        index1 += 1
      end
    else
      index1 += 1
    end
    index2 += 1
  end

  true
end

puts one_away('pale', 'ple')       # true
puts one_away('pale', 'pales')     # true
puts one_away('pale', 'bale')      # true
puts one_away('pale', 'bake')      # false
puts one_away('pales', 'pale')     # true
puts one_away('pales', 'palessss') # false

puts '============================================'

puts all_in_one_away('pale', 'ple')       # true
puts all_in_one_away('pale', 'pales')     # true
puts all_in_one_away('pale', 'bale')      # true
puts all_in_one_away('pale', 'bake')      # false
puts all_in_one_away('pales', 'pale')     # true
puts all_in_one_away('pales', 'palessss') # false
