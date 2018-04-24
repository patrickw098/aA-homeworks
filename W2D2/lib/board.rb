class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new {[]} }

    place_stones
  end

  def place_stones
    (0..5).each do |i|
      4.times do |time|
        @cups[i] += [:stone]
      end
    end
    (7..12).each do |j|
      4.times do |time|
        @cups[j] += [:stone]
      end
    end
  end

  def valid_move?(start_pos)
    return true if start_pos.between?(0,5) && start_pos.between?(7,12)
    raise "Invalid starting cup"
  end

  def make_move(start_pos, current_player_name)
    start = @cups[start_pos]
    @cups[start_pos] = []
    index = (start_pos) % 14

    until start.empty?


      index = (index + 1) % 14

      index = (index + 1) % 14 if current_player_name == @player1 && index == 13
      index = (index + 1) % 14 if current_player_name == @player2 && index == 6

      @cups[index] << start.pop
    end

    render
    next_turn(index)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }

  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      @player1
    else
      @player2
    end
  end
end
