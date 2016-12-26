Question 1

10.times {|x| puts (" "*x + "The Flintstones Rock!")}

Question 2

statement = "The Flintstones Rock"
statement_hash = {}

statement.each_char do |x|
  statement_hash[x] = statement.count(x)
end
puts statement_hash

Question 3

"(40+2)" was still being seen as a number and not a string.  It needs to be converted to a string type.

puts "the value of 40 + 2 is " + (40 + 2).to_s
or
puts "the value of 40 + 2 is #{40 + 2}"

Question 4

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
1
3
=> [3, 4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
1
2
=> [1, 2]

Question 5

def factors(number)
  dividend = number
  divisors = []
  if dividend <1 
    puts "Please enter a number greater than 0."
  end
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts factors(200)
puts factors(0)
puts factors(-10)

=begin

Bonus 1

The "%" produces the remainder from division.  If it equals 0 than the divisors goes into the original 0 evenly.

Bonus 2

The line "divisors" is returning the array as opposed to returning "nil".


  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
=end

Question 6

Yes the << is mutating the the original object the user input where as + does not.

Question 7

I added limit as a argument to the method

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

Question 8

def titleize(words)
  arr_words = words.split(" ")
  arr_words.map{|x| x.capitalize!}
  p arr_words.join(" ")
end
titleize("the empire strikes back")

Question 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munster = munsters.each do |x, y|
  case y["age"]
    when (0..17) then y["age_group"] = "kid"
    when (18..64) then y["age_group"] = "adult"
    else y["age_group"] = "senior"
  end
end
puts munster
