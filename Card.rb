class Card
  attr_reader :definition, :answer

  def initialize(args={})
    @definition=args[:definition]
    @answer=args[:answer]
  end

  def check?(guess)
    @answer == guess.strip.downcase
  end

end

