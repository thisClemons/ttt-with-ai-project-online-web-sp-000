module Players
  class Human < Player

    def move(board)
      board.display
      puts "Your move #{self.token}. Please enter 1-9"
      gets
    end
  end
end
