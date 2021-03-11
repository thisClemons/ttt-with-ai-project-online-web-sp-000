module Players

  class Computer < Player

    def move(board)

      choices = options(board)

      # If computer can win, makes winning move
      if two_of_three?(board)
        input = two_of_three?(board)

      # If other player is about to win, blocks
      elsif defense?(board)
        input = defense?(board)

      # If the middle is open, take the middle
      elsif board.valid_move?(5)
        input = 5

      # If a corner is open, take a random corner
      elsif corner_options(board).size > 0
        input = corner_options(board).sample

      # Take a random space if above options not available
      else
        input = rand(1..9) while !board.valid_move?(input)
      end
      input.to_s
    end


    def two_of_three?(board)
      index = nil
      Game::WIN_COMBINATIONS.each do |combo|
        state = [board.at(combo[0]), board.at(combo[1]), board.at(combo[2])]
        if state.count(self.token) == 2 && state.include?(" ")
          index = combo[state.index(" ")]
        end
      end
      index + 1 if index
    end

    def defense?(board)
      index = nil
      self.token == "X" ? enemy = "O" : enemy = "X"

      Game::WIN_COMBINATIONS.each do |combo|
        state = [board.at(combo[0]), board.at(combo[1]), board.at(combo[2])]
        if state.count(enemy) == 2 && state.include?(" ")
          index = combo[state.index(" ")]
        end
      end
      index + 1 if index
    end

    def options(board)
      choice = []
      board.cells.each_with_index do |spot, index|
        choice.push(index + 1) if spot == " "
      end
      choice
    end

    def corner_options(board)
      options(board).select {|spot| [1, 3, 7, 9].include?(spot)}
    end

  end
end
