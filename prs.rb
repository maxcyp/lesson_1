


def player_picks
  puts "Choose one: (P/R/S)"
  choice = gets.chomp.upcase
end

def computer_picks
  c = ['P','R','S']
  c.sample
end

def check_winner(player, computer)
  if player == 'P' and computer == 'P'
    puts "It's a tie"
  elsif player == 'R' and computer == 'R'
    puts "It's a tie"
  elsif player == 'S' and computer == 'S'
    puts "It's a tie"
  else
    puts "nope"
  end
end

def play_again
  puts "Play again? "
  answer = gets.chomp.to_i
  if answer == 1
    puts "bye!"
    return nil
  else
    return 1
  end
end


puts "Play Paper Rock Scissors!"
begin
  player = player_picks
  computer = computer_picks
  check_winner(player, computer)

end until !play_again