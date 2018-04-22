require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @sequence_length = 1
    @seq = []
  end

  def play
    @game_over = false
    puts "Welcome to Simon!"

    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    round_success_message unless @game_over == true
    @sequence_length += 1
  end

  def show_sequence
    add_random_color

    #byebug

    @seq.each_with_index do |color,i|
      system("clear")
      puts "#{i + 1} #{color}"
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Now repeat the sequence! (ex: red yellow blue green)"

    user_sequence = gets.chomp.split(" ")
    @game_over = true unless @seq == user_sequence
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Correct!"
    puts "Next Round..."
    sleep(2)
  end

  def game_over_message
    puts "You matched a sequence of length #{sequence_length - 2}"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end
