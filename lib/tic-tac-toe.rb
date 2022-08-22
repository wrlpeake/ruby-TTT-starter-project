class Game
    def welcomeMessage
        message = "Welcome to Tic-Tac-Toe (AKA Knoughts & Crosses)"
        return message
    end
end

newGame = Game.new
puts newGame.welcomeMessage