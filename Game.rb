require_relative 'Deck'
require_relative 'Card'
DECK_NAME={1=>"sports",2=>"general",3=>"movies",4=>"tv"}
class Game
  def initialize
    @current_deck = nil #the current Deck Object that we are gonna use
  end

  def run
    input ="haha"
    while input!="exit"
      puts "Please choose a new deck:"
      puts "type 1 for sports, 2 for general trivia, 3 for movies, or 4 for tv"

      deck_choice=gets.chomp
      while ![1,2,3,4].include?(deck_choice.to_i)
        puts "type 1 for sports, 2 for general trivia, 3 for movies, or 4 for tv"
        deck_choice=gets.chomp
      end

      @current_deck=Deck.new(DECK_NAME[deck_choice.to_i])
      puts ""

      @current_deck.cards.each{|card| #Card Object
        puts "Definition: "+ card.definition
        print "Guess: "
        guess = gets.chomp

        2.times{|counter|
          if card.check?(guess)
            break
          end
          puts "Wrong, you have #{2-counter} more chances"
          print "Guess: "
          guess = gets.chomp
        }

        if !card.check?(guess)
          puts""
          puts "Sorry, you have no more chances left! Moving on to the next card ..."
          puts""
        else
          puts ""
          puts "Good job! Moving on to the next card....."
          puts ""
        end
      }
      puts "You've gone through all cards in the deck!"
      puts "If you would like to exit, please type 'exit'. Else, please type 'i love you' to restart."
      input = gets.chomp
    end
  end

end

game=Game.new
game.run

