module GameLogic
  class Player
    attr_accessor :bet

    def initialize(bet = nil)
      @bet = bet
    end

    def set_random_bet
      self.bet = BETS.values.sample
    end
  end
end
