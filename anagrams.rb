# def first_anagram(string1, string2)
#

#
#
#
# end

# class Array
#   def my_anagram
#     return self if self.length == 1
#     ana_array = []
#
#
#     self.length.times do
#       self.push(self.shift)
#       ana_array.concat(self.drop(1).my_anagram)
#
#     end
#     ana_array
#   end
# end

def first_anagram(string1, string2)
  str1_arr = string1.split("")
  str2_arr = string2.split("")
  str2_arr.permutation.to_a.include?(str1_arr)
end

# p x = first_anagram("gizmo", "sally")
# p y = first_anagram("elvis", "lives")

# time complexity  n!


def second_anagram?(string1, string2)
  str1_arr = string1.split("")
  str2_arr = string2.split("")
  string1.each_char do |char|
    if str1_arr.count(char) == str2_arr.count(char)
      str1_arr.delete(char)
      str2_arr.delete(char)
    end
  end
  return true if str1_arr.empxy? && str2_arr.empty?
  false
end
#time complexity n^2    (really is 4n^2 )

def third_anagram?(string1, string2)
  string1.split("").sort! == string2.split("").sort!
end
#time complexity n^2 but with Ruby optimization,
# with Ruby it is NlogN


def fourth_anagram?(str1, str2)
  hash1 = {}
  hash2 = {}

  str1.each_char do |char|
    hash1[char] = str1.count(char)
  end

  str2.each_char do |char|
    hash2[char] = str2.count(char)
  end

  hash1 == hash2
end
#time_complexity n^2

# p x = fourth_anagram?("gizmo", "sally")
# p y = fourth_anagram?("elvis", "lives")


def bonus_anagram?(str1, str2)
  hash1 = Hash.new { |k, v| k[v] = 0 }
  str1.each_char do |char|
    hash1[char] += 1
  end
  str2.each_char do |char|
    hash1[char] -= 1
  end
  hash1.values.all? { |value| value == 0 }
end
p x = bonus_anagram?("gizmo", "sally")
p y = bonus_anagram?("elvis", "lives")


# time complexity is O(n)
