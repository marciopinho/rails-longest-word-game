require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = (0...8).map { ('A'..'Z').to_a[rand(26)] }.join
    @start_time = Time.now
  end

  def score
    @user_input = params[:word]
    letters = params[:letters].split
    time_elapsed = Time.now - @start_time
    # usar api do wagon para determinar length da palavra.
    # A key length não existe se a palavra não foor válida. "https://wagon-dictionary.herokuapp.com/#{word}"

    if check_word(input)

    end
  end
  # este método confirma se a palvra é formada por letras no grid
  def grid_check(user_input, letters)
    user_input.chars.all? { |char| letters.include? char }
  end

  # este método confere se a palavra existe. Igualando a true, se foun for false, true+false = false :)
  def check_word(word)
    attempt = URI.open("https://wagon-dictionary.herokuapp.com/#{word}").read
    JSON.parse(attempt)['found'] == true
  end
end
# -----------------------------------
def score
  require "open-uri"
  url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
  @flats = JSON.parse(open(url).read)
  @testy = params[:answer]

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.split.count(letter) <= grid.count(letter) }
  end

  if included?(@testy.upcase, @letters)
    if @flats['found'] == true
      @answer = "Good Job !"
    else
      @answer = "This is not a valid English word !"
    end
  else
    @answer = "Can't build from given letters"
  end
end
