VALID_CHOICES = %w(rock(r) paper(p) scissors(c) spock(p) lizard(l))

def win?(player1, player2)
  (player1 =='rock' && player2 == 'scissors') ||
  (player1 =='rock' && player2 == 'lizard') ||
  (player1 == 'paper' && player2 == 'rock') ||
  (player1 =='paper' && player2 == 'spock') ||
  (player1 =='scissors' && player2 == 'lizard') ||
  (player1 == 'scissors' && player2 == 'paper') ||
  (player1 =='lizard' && player2 == 'spock')  ||
  (player1 =='lizard' && player2 == 'paper') ||
  (player1 =='spock' && player2 == 'rock')  ||
  (player1 =='spock' && player2 == 'scissors')
end
=begin
def display_results(player, computer)
  if  (player =='rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    prompt("You Won!")
  elsif (player == 'scissors' && computer == 'rock') ||
        (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors')
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
end
=end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this battle!")
  elsif win?(computer, player)
    prompt("Computer won this battle!")
  else
    prompt("You tied!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

choice = ""
user_score = 0
comp_score = 0
loop do
  loop do
  prompt("Choose one: #{VALID_CHOICES.join(' ')}")
  choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    elsif choice.downcase() == "r"
      choice = "rock"
      break
    elsif choice.downcase() == "l"
      choice = "lizard"
      break
    elsif choice.downcase() == "p"
      choice = "spock"
      break
    elsif choice.downcase() == "c"
      choice = "scissors"
      break      
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = ['rock', 'paper', 'scissors', 'spock', 'lizard'].sample

  prompt("You chose: #{choice} -- Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  user = 0
  comp = 0
  if win?(choice, computer_choice)
    user = 1
    prompt "Player + 1"
  elsif win?(computer_choice, choice)
    comp = 1
    prompt "Computer + 1"
  else
    prompt("No one scored.")
  end
  user_score = user_score + user
  comp_score = comp_score + comp
  prompt "-----------------------------"
  prompt("The score is Player: #{user_score} -- Computer: #{comp_score}")
  prompt "-----------------------------"

  if user_score == 5
    prompt "You have won the war!  Game over."
    user_score = 0
    comp_score = 0
    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  elsif comp_score == 5
    prompt "Computer has won the war!  Game over."
    user_score = 0
    comp_score = 0
    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  else    
    prompt("The game is not over do you want to continue?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  end
end

prompt("Thank you for playing.  Good bye!")

