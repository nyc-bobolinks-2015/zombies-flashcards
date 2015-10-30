class Game
  def initialize
    DECK_NAME={1=>"sports",2=>"general",3=>"movies",4=>"tv"}
    @current_deck = nil #the current Deck Object that we are gonna use
  end

  def run
    input ="haha"
    while input!="exit"
      puts "Please choose a new deck:"
      puts "type 1 for sports, 2 for general trivia, 3 for movies, or 4 for tv"

      @current_deck=Deck.new(DECK_NAME[gets.chomp])
      puts ""

      @current_deck.cards.each{|card| #Card Object
        puts "definition "+ card.definition
        print "guess: "
        guess = gets.chomp
        chance = 2

        while !card.check?(guess) && chance > 0
          chance -= 1
          puts "wrong, you have #{chance} more chance"
          print "guess: "
          guess = gets.chomp
        end

        if chance == 0
          puts "Sorry, you have no more chances left! Moving on to the next card ..."
        else
          puts "Good job! Moving on to the next card....."
        end
      }
      puts "You've gone through all cards in the deck!"
      puts "If you would like to exit, please type 'exit'. Else, please type 'i love you'."
      input = gets.chomp
    end
  end

end


