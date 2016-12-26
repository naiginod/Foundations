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
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
=end