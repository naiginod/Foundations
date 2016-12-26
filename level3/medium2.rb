Question 1

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
age_sum = 0
munsters.each do |name, details|
  if details["gender"] == "male"
    age_sum += details['age']
  end
end
p age_sum

Question 2

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}"
end

Question 3

def easy_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
(my_string, my_array)

my_string, my_array = easy_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

Question 4

sentence = "Humpty Dumpty sat on a wall."
sentence.split(" ").reverse.join(" ")

--
words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.'

Question 5

34, because the method does not affect mutate the original object

Question 6

Yes, because "munsters" does not get reassigned inside the method so the original is affected.

Question 7

paper

Question 8

"no" because methods return the last line by default and for foo() that is "yes".  So bar("yes") throws a false for the question param =="no".  False returns "no"
