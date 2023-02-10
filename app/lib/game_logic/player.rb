# frozen_string_literal: true

module GameLogic
  class Player
    attr_accessor :name, :bet

    def initialize(name, bet = nil)
      @name = name
      @bet = bet
    end

    def set_random_bet
      self.bet = BETS.values.sample
    end
  end
end
