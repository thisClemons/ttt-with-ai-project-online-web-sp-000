class Board

  attr_accessor :cells

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts ""
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end


  def index(input)
    input.to_i - 1
  end

  def position(input)
    cells[index(input)]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.count(" ")
  end

  def taken?(input)
    cells[index(input)] != " "
  end

  def valid_move?(input)
    (0..8).to_a.include?(index(input)) && !taken?(input)
  end

  def update(input, player)
    cells[index(input)] = player.token
  end

  def at(index)
    cells[index]
  end








end
