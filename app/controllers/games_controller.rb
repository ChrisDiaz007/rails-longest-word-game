require 'open-uri'

class GamesController < ApplicationController
  def new
    alphabet = ('A'..'Z').to_a
    @letters = alphabet.sample(10)
  end

  def score
    @word = params[:word]
    url = "https://dictionary.lewagon.com/#{@word}"
    @response = URI.open(url).read
    @response = JSON.parse(@response)
    @english_word = @response

    @letters = params[:letters].split

    if @english_word["found"] && @word.upcase.chars.all?{ |str| @word.upcase.count(str) == @letters.count(str)}
      @result = "Congratulations! #{@word.upcase} is a valid English word!"
    else
      @result = "Sorry but #{@word.upcase} does not seem to be a valid English word.."
    end
    # raise
  end
end
