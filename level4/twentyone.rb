CARD_INDEX = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
CARD_SUITS = %w(Hearts Spades Clubs Diamonds).freeze
CARD_VALUE = ((2..10).to_a << [10] * 3 << [11]).flatten

def prompt(msg)
  puts "==> " + msg
end

def initialize_deck
  fresh_deck = CARD_INDEX.product(CARD_SUITS).map { |card| card.join(" of ") }
  card_vals = (CARD_VALUE * 4).sort
  fresh_deck_hash = Hash[fresh_deck.zip(card_vals)]
  fresh_deck_hash
end

def card_dealt(deck)
  card = deck.keys.sample
  card_value = deck[card]
  deck.delete(card)
  card_hash = [card, card_value]
  card_hash
end

def print_card_info(cards, recipient, show_card = true)
  if show_card == true
    prompt "#{recipient} was dealt #{cards[-1][0]} worth #{cards[-1][1]}."
  else
    prompt "#{recipient} was dealt unknown card."
  end
end

def linebreak
  puts "--" * 20
end

def card_total(cards)
  total = 0
  cards.each { |x| total += x[1] }
  total
end

def winner(score1, score2)
  winner_array = [score1, score2]
  winner_array.max
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def round_total(total1, total2)
  prompt "Player: " + total1.to_s
  prompt "Dealer: " + total2.to_s
end

def hand_total(recipient, recipient_name)
  prompt "#{recipient_name} total is #{card_total(recipient)}."
end

player_round_total = 0
dealer_round_total = 0

loop do
  deck = initialize_deck
  player = []
  dealer = []
  busted = false

  linebreak
  player << card_dealt(deck)
  print_card_info(player, "Player")
  player << card_dealt(deck)
  if (card_total(player) > 21) && (player[-1][1] == 11)
    player[-1][1] = 1
    card_total(player)
  end
  print_card_info(player, "Player")
  hand_total(player, "Player")
  linebreak
  dealer << card_dealt(deck)
  print_card_info(dealer, "Dealer")
  dealer << card_dealt(deck)
  if (card_total(dealer) > 21) && (dealer[-1][1] == 11)
    dealer[-1][1] = 1
    card_total(dealer)
  end

  print_card_info(dealer, "Dealer", false)

  loop do                 # Player loop
    linebreak
    prompt "Would you like to 'Hit' or 'Stay'?"
    player_response = gets.chomp
    break if player_response.downcase.start_with?('s')

    player << card_dealt(deck)
    if (card_total(player) > 21) && (player[-1][1] == 11)
      player[-1][1] = 1
      card_total(player)
      print_card_info(player, "Player")
      hand_total(player, "Player")
    elsif card_total(player) > 21
      print_card_info(player, "Player")
      hand_total(player, "Player")
      prompt "Player busted!"
      busted = true
      dealer_round_total += 1
      round_total(player_round_total, dealer_round_total)
      break
    else
      print_card_info(player, "Player")
      hand_total(player, "Player")
    end
  end       # End Player loop

  if dealer_round_total == 5
    prompt "Dealer Wins!"
    player_round_total = 0
    dealer_round_total = 0
    play_again? ? next : break
  elsif busted
    play_again? ? next : break
  end

  linebreak
  prompt "Dealer second card is #{dealer[-1][0]} worth #{dealer[-1][1]}"

  loop do                  # Dealer loop
    break if (17..21).cover?(card_total(dealer))

    dealer << card_dealt(deck)

    if (card_total(dealer) > 21) && (dealer[-1][1] == 11)
      dealer[-1][1] = 1
      card_total(dealer)
      print_card_info(dealer, "Dealer")
    elsif card_total(dealer) > 21
      print_card_info(dealer, "Dealer")
      hand_total(player, "Player")
      hand_total(dealer, "Dealer")
      prompt "Dealer busted!"
      busted = true
      player_round_total += 1
      round_total(player_round_total, dealer_round_total)
      break
    else
      print_card_info(dealer, "Dealer")
    end
  end                   # End dealer loop

  if player_round_total == 5
    prompt "Player Wins!"
    player_round_total = 0
    dealer_round_total = 0
    play_again? ? next : break
  elsif busted
    play_again? ? next : break
  end

  linebreak

  if card_total(dealer) == card_total(player)
    hand_total(player, "Player")
    hand_total(dealer, "Dealer")
    round_total(player_round_total, dealer_round_total)
    prompt "You have tied."
  elsif winner(card_total(player), card_total(dealer)) == card_total(player)
    hand_total(player, "Player")
    hand_total(dealer, "Dealer")
    player_round_total += 1
    round_total(player_round_total, dealer_round_total)
    prompt "Player has won!"
  else
    hand_total(player, "Player")
    hand_total(dealer, "Dealer")
    dealer_round_total += 1
    round_total(player_round_total, dealer_round_total)
    prompt "Dealer has won!"
  end

  if player_round_total == 5
    prompt "Player Wins!"
    player_round_total = 0
    dealer_round_total = 0
  elsif dealer_round_total == 5
    prompt "Dealer Wins!"
    player_round_total = 0
    dealer_round_total = 0
  end

  play_again? ? next : break
end

prompt "Thank you for playing Twenty-One!  Goodbye!"