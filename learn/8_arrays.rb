
my_array = ["one", "two", "three"]

puts my_array.size

puts my_array.first
puts my_array.last

#########################
student_names = ["Ayon", "Anthony", "Devi", "Dheekshita", "Bryce", "Akshita", "Keerthi", "Zinia", "Akhila", "Riley", "Shefali"]
student_names.each do |element|
  puts element
end
#########################
numbers = [1, 5, 10]
sum = 0
numbers.each do |number|
  sum = sum + number
end
puts sum
