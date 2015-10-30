require 'csv'
require_relative 'Card'



class Deck
  attr_reader :cards, :file

  def initialize(theme)

    @file="Flashcards-#{theme.downcase}.csv"
    @cards=[]
    load
  end

  def load
    CSV.foreach(file,headers: true, header_converters: :symbol).map{|row| @cards << Card.new(row)}
  end

end
