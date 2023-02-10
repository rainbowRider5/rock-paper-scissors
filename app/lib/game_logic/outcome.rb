# frozen_string_literal: true

module GameLogic
  class Outcome
    VERDICTS = { WIN: "WIN", LOSS: "LOSS", DRAW: "DRAW" }.freeze

    attr_reader :verdict, :winner, :winning_bet

    def initialize(verdict:, winner:, winning_bet:)
      @verdict = verdict
      @winner = winner
      @winning_bet = winning_bet
    end
  end
end
