require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { [*'A'..'Z'].sample }
  end



  def score
    raise
    @guess = params[:guess]
    url = "https://wagon-dictionary.herokuapp.com/#{@guess}"
    url_serialized = URI.open(url).read
    guess = JSON.parse(url_serialized)


    check = @guess.chars.all? do |letter|
      @guess.chars.count(letter) <= @letters.count(letter)
    end


    if guess["found"] == false
      @result = "Perdu !"
    elsif check = true;
      @result = 'Gagné'
    end

  end
end
