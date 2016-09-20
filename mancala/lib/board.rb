require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups[0..5] = @cups[0..5].map {|c| c += [:stone, :stone, :stone, :stone] }
    @cups[7..12] = @cups[7..12].map {|c| c += [:stone, :stone, :stone, :stone] }
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !start_pos.between?(1,13)
  end

  def make_move(start_pos, current_player_name)
    i = 0
    until @cups[start_pos].empty?
      pos = (start_pos + i) % 14
      @cups[pos]<< @cups[start_pos].pop unless pos == opponents_cup(current_player_name)
      i += 1
    end
    render
    next_turn(pos, current_player_name)
  end

  def opponents_cup(name)
    name == @name1 ? 13 : 6
  end

  def next_turn(ending_cup_idx, name)
    # debugger
    if ending_cup_idx == current_player_points_cup(name)
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def current_player_points_cup(name)
    name == @name1 ? 6 : 13
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    # debugger
    row_empty?(@cups[0..5]) || row_empty?(@cups[7..12])
  end

  def row_empty?(row)
    row.each do |cup|
      return false if cup.length >= 1
    end
    true
  end

  def winner
    comparison = @cups[6] <=> @cups[13]
    comparison == 1 ? @name1 : comparison == -1 ? @name2 : :draw
  end
end
