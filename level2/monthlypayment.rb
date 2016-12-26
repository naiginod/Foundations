puts "Enter Loan Amount: "
loan_amt = gets.chomp!.to_f

puts "Enter Annual Percentage Rate: "
apr = gets.chomp!.to_f
mir = apr / 100
mir /=12
puts "Your monthly compound rate: " + mir.to_s

puts "Enter loan duration length in years: "
loan_yrs = gets.chomp!.to_f
loan_mn = loan_yrs*12
puts "The length of of your in months: " + loan_mn.to_s

mn_pymnt = loan_amt * (mir / (1 - (1 + mir)**(-loan_mn)))
mn_pyt = "%.2f" %mn_pymnt

puts "Your monthly payment is $" + mn_pyt.to_s


=begin
m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months
=end

