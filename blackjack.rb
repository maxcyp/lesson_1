
require 'pry'

def initialize_deck
  deck = Hash.new
  deck = { 
    "Ace of Clubs"    => 11,    "Ace of Clubs"      => 11,   "Ace of Diamonds"    => 11,    "Ace of Diamonds"   => 11,
    "Ace of Hearts"   => 1,     "Ace of Hearts"     => 1,    "Ace of Spades"      => 1,     "Ace of Spades"     => 1,
    "Two of Clubs"    => 2,     "Two of Diamonds"   => 2,    "Two of Hearts"      => 2,     "Two of Spades"     => 2,
    "Three of Clubs"  => 3,     "Three of Diamonds" => 3,    "Three of Hearts"    => 3,     "Three of Spades"   => 3,
    "Four of Clubs"   => 4,     "Four of Diamonds"  => 4,    "Four of Hearts"     => 4,     "Four of Spades"    => 4,
    "Five of Clubs"   => 5,     "Five of Diamonds"  => 5,    "Five of Hearts"     => 5,     "Five of Spades"    => 5,
    "Six of Clubs"    => 6,     "Six of Diamonds"   => 6,    "Six of Hearts"      => 6,     "Six of Spades"     => 6,
    "Seven of Clubs"  => 7,     "Seven of Diamonds" => 7,   "Seven of Hearts"     => 7,     "Seven of Spades"   => 7,
    "Eight of Clubs"  => 8,     "Eight of Diamonds" => 8,    "Eight of Hearts"    => 8,     "Eight of Spades"   => 8,
    "Nine of Clubs"   => 9,     "Nine of Diamonds"  => 9,    "Nine of Hearts"     => 9,     "Nine of Spades"    => 9,
    "Ten of Clubs"    => 10,    "Ten of Diamonds"   => 10,    "Ten of Hearts"     => 10,     "Ten of Spades"    => 10,
    "Jack of Clubs"   => 10,    "Jack of Diamonds"  => 10,    "Jack of Hearts"    => 10,     "Jack of Spades"   => 10,
    "Queen of Clubs"  => 10,    "Queen of Diamonds" => 10,    "Queen of Hearts"   => 10,     "Queen of Spades"  => 10,
    "King of Clubs"   => 10,    "King of Diamonds"  => 10,    "King of Hearts"    => 10,     "King of Spades"   => 10
  }
  deck
end

def draw_screen(d, p, o)
  system 'cls'
  puts "Cards remaining: #{d.count}"
  player_score = 0
  dealer_score = 0

  p.values.each {|i| player_score = i + player_score}
  o.values.each {|i| dealer_score = i + dealer_score}

  puts "Dealer: #{dealer_score}"
  puts "Player: #{player_score}"
end

def deal(d, p)
  deck = d.keys
  player_card = deck[rand(deck.length)]
  player_card_value = d[player_card]
  p[player_card] = player_card_value

  d.delete(player_card)
end

def check_win(p,d)
  player_score = p.values.inject{|sum, x| sum + x}
  dealer_score = d.values.inject{|sum, x| sum + x}
  
  if dealer_score == 21
    puts "Dealer wins.. Blackjack!"
  elsif dealer_score != 21 && player_score == 21
    puts "Player wins.. Blackjack!"
  elsif dealer_score > player_score && dealer_score < 21
    puts "Dealer wins..: "
    d.keys.each {|i| print "[#{i}] "}
  elsif player_score > dealer_score && player_score < 21
    puts "Player wins..: "
    p.keys.each {|i| print "[#{i}] "}
  elsif dealer_score > 21
    puts "Dealer Busted!"
  elsif dealer_score == player_score
    puts "It's a tie!"
  else
    puts "Player Busted!"
  end 
end

def quit
  begin
    print "\nPlay again (y/n)?: "
    choice = gets.chomp

    if choice.downcase == "y"
      return false
    elsif choice.downcase == "n"
      return true
    else 
      understand = false
    end
  end until understand
end

begin
  deck = initialize_deck
  player_hand = Hash.new
  dealer_hand = Hash.new

  deal(deck, player_hand)
  deal(deck, dealer_hand)
  deal(deck, player_hand)
  deal(deck, dealer_hand)

  draw_screen(deck, player_hand, dealer_hand)
  
  begin

    player_score = player_hand.values.inject{|sum, x| sum + x}
    draw_screen(deck, player_hand, dealer_hand)

    puts "Hit or Stay: "
    choice = gets.chomp

    if player_score == 21
      end_player_loop = true
    elsif player_score > 21
      end_player_loop =true
    elsif choice.downcase == "hit"
      end_player_loop = false
      deal(deck, player_hand)
      end_player_loop 
    elsif choice.downcase == "stay"
      end_player_loop = true
    else
      end_player_loop = false
    end

  end until end_player_loop

  begin
    dealer_score = dealer_hand.values.inject{|sum, x| sum + x}

    if dealer_score < 17
      deal(deck, dealer_hand)
      end_dealer_loop = false
    else
      end_dealer_loop = true
    end
      draw_screen(deck, player_hand, dealer_hand)
  end until end_dealer_loop

  check_win(player_hand, dealer_hand)

end until quit