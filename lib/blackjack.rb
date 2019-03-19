def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def deal_card
  # code #deal_card here
  card = rand(1..11)
  return card
end

def display_card_total(total)
  # code #display_card_total here
  puts "Your cards add up to #{total}"
end

def display_dealer_total(total)
  puts "The Dealers cards add up to #{total}"
end

def prompt_user
  # code #prompt_user here
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  # code #get_user_input here
  gets.chomp
end

def end_game(total)
  # code #end_game here
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def dealer_wins(total_dealer, total_player)
  puts "The Dealer wins this round with #{total_dealer} to your #{total_player}."
  exit
end

def player_wins(total_player, total_dealer)
  puts "You beat the dealer #{total_player} to #{total_dealer}!"
  exit
end

def initial_round
  # code #initial_round here
  hand_a = deal_card
  hand_b = deal_card
  hand_total = hand_a + hand_b
  return hand_total
end

def hit?(current_hand)
  # code hit? here
  prompt_user
  action = get_user_input
  if action == 's'
    return current_hand
  elsif action == 'h'
    new_card = deal_card
    current_hand += new_card
    return current_hand
  else
    invalid_command
    return current_hand
  end
end

def dealer_hit?(dealer_hand)
  if dealer_hand < 17
    new_card = deal_card
    dealer_hand += new_card
  else
    dealer_hand
  end
end

def invalid_command
  # code invalid_command here
  puts "Please enter a valid command"
end

def check_win(dealer, player)
  if(dealer > player && dealer <= 21)
      dealer_wins(dealer, player)
  elsif(dealer < player && player <= 21)
      player_wins(player, dealer)
    end
  end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  # code runner here
  turn = 0
  welcome
  card_total = initial_round
  display_card_total(card_total)
  dealer_total = initial_round
  display_dealer_total(dealer_total)
  while card_total <= 21
    card_total = hit?(card_total)
    display_card_total(card_total)
    dealer_total = dealer_hit?(dealer_total)
    display_dealer_total(dealer_total)
    check_win(dealer_total, card_total)
  end
  end_game(card_total)
end
