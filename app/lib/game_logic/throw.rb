# frozen_string_literal: true

module GameLogic
  class Throw
    BETS = { ROCK: "ROCK", PAPER: "PAPER", SCISSORS: "SCISSORS" }.freeze
    OUTCOMES = { WIN: "WIN", LOSS: "LOSS", DRAW: "DRAW" }.freeze

    attr_reader :bet

    class << self
      def new_random
        new(BETS.values.sample)
      end
    end

    def initialize(bet)
      raise ArgumentError if BETS.values.exclude?(bet)

      @bet = bet
    end

    def compare!(another_throw)
      raise InvalidThrowError unless another_throw.is_a?(Throw)

      another_bet = another_throw.bet
      return OUTCOMES[:DRAW] if bet == another_bet

      case bet
      when BETS[:ROCK] then compare_rock_to(another_bet)
      when BETS[:PAPER] then compare_paper_to(another_bet)
      when BETS[:SCISSORS] then compare_scissors_to(another_bet)
      end
    end

    private

    def compare_rock_to(bet)
      bet == BETS[:PAPER] ? OUTCOMES[:LOSS] : OUTCOMES[:WIN]
    end

    def compare_paper_to(bet)
      bet == BETS[:SCISSORS] ? OUTCOMES[:LOSS] : OUTCOMES[:WIN]
    end

    def compare_scissors_to(bet)
      bet == BETS[:ROCK] ? OUTCOMES[:LOSS] : OUTCOMES[:WIN]
    end
  end
end
