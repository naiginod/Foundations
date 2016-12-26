Question 1
ages.include?("Spot")

Question 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_sum = 0
ages.each do |x, y|
  ages_sum +=y
end
ages_sum

or 

ages.values.inject(:+)

Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if {|_,age| age < 100}

Question 4

munsters_description = "The Munsters are creepy in a good way."
- munsters_description.capitalize!
- munsters_description.swapcase!
- munsters_description.downcase!
- munsters_description.upcase!

Question 5

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages = ages.merge!(additional_ages)

Question 6

ages.values.min 

Question 7

advice = "Few things in life are as important as house training your pet dinosaur."
advice.include? "Dino"

Question 8

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |name| name[0, 2] == "Be" }

Question 9

flintstones.map! do |name|
  name[0,3]
end

Question 10

flintstones.map! {|name| name[0,3]}

