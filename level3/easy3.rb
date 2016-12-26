Question 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Question 2

flintstones << "Dino"

Question 3

flintstones.push("Dino", "Hoppy")

or 

flintstones.concat(%w(Dino Hoppy))

Question 4

advice.slice!(0, advice.index('house')) # "Few things in life are as important as "
advice = advice[advice.index('house')..-1] #"house training your pet dinosaur."

Question 5

statement.count "t"

or 

statement.scan('t').count

Question 6

title.center(40)


