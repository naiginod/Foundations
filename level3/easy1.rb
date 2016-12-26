=begin
Question 1
 This should output [1,2,3]

Question 2
  The difference is "!" mutates the caller where "?" checks status of objects.
1) "!=" is the symbol for testing for non-equivalency between objects.

Question 3
advice = "Few things in life are as important as house training your pet dinosaur."

advice.sub! "important","urgent"

Question 4
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) - Delete the object at numbers[1]
numbers.delete(1) - Delete object "1"

Question 5
42.between?(10,100)

Question 6
famous_words = "seven years ago..."
  "Four score and " << famous_words
  "Four score and " + famous_words

Question 7

It evaluates to 42

Question 8

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten
["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]

Question 9
barney_arr = flintstones.assoc "Barney"\

Question 10

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

=end