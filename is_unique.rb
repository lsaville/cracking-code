require 'pry'

# version with extra data structure
#def is_unique?(string)
#  store = {}
#
#  string.chars.each do |char|
#    if store[char]
#      return false
#    else
#      store[char] = true
#    end
#  end
#
#  true
#end

# this version doesn't use another data structure, but I think it also creates extra strings.
# ideally this would be avoided
def is_unique?(string)
  end_of_string = string.length - 1
  index     = 0

  string.chars.each do |char|
    #I'd need to know a bit more about ruby internals, 
    #but this piece feels like it would create a new
    #substring everytime you do bracket notation with
    #a range.
    #string[index + 1, max_index].chars.each do |char2|
    #  return false if char == char2
    #end

    #This version indexes in without creating any
    #substrings
    #(index + 1).upto(end_of_string) do |n|
    #  return false if char == string[n]
    #end

    ((index + 1)..end_of_string).each do |n|
      return false if char == string[n]
    end

    index += 1
  end

  true
end

a = '1234'
b = '13422'
c = '115543543'

puts '================='
puts is_unique?(a)
puts '================='
puts is_unique?(b)
puts '================='
puts is_unique?(c)
puts '================='
