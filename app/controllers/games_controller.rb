class GamesController < ApplicationController
  require 'json'
  require 'open-uri'

  url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
  user_serialized = URI.open(url).read
  user = JSON.parse(user_serialized)

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

 def scores
    @answer = params[:answer].upcase
    letters_to_check = params[:letters].split('')
    answer_to_check = @answer.split('')
    is_in_the_grid = true
    is_a_real_word = false
    @win = false

    answer_to_check.each do |letter|
      if !letters_to_check.include?(letter)
        is_in_the_grid = false
        break
      end
    end
    is_a_real_word = true if word['found'] == true

    if is_in_the_grid == true && is_a_real_word == true
      @win = true
    end

    @win
  end
