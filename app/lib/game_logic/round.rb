# frozen_string_literal: true

module GameLogic
  class Round
    attr_reader :player1, :player2, :outcome

    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @outcome = nil
    end

    def play!
      raise(InvalidBetError) unless valid_players_bets?

      if player1.bet == player2.bet
        return Outcome.new(verdict: Outcome::VERDICTS[:DRAW], winner: nil, winning_bet: player1.bet)
      end

      if player1_won?
        Outcome.new(verdict: Outcome::VERDICTS[:WIN], winner: player1, winning_bet: player1.bet)
      else
        Outcome.new(verdict: Outcome::VERDICTS[:LOSS], winner: player2, winning_bet: player2.bet)
      end
    end

    private

    def valid_players_bets?
      [player1, player2].map(&:bet).all? { |player_bet| GameLogic::BETS.value?(player_bet) }
    end

    def player1_won?
      opposing_bet = player2.bet

      case player1.bet
      when GameLogic::BETS[:ROCK] then rock_wins_against?(opposing_bet)
      when GameLogic::BETS[:PAPER] then paper_wins_against?(opposing_bet)
      when GameLogic::BETS[:SCISSORS] then scissors_win_against?(opposing_bet)
      end
    end

    def rock_wins_against?(opposing_bet)
      opposing_bet == GameLogic::BETS[:SCISSORS]
    end

    def paper_wins_against?(opposing_bet)
      opposing_bet == GameLogic::BETS[:ROCK]
    end

    def scissors_win_against?(opposing_bet)
      opposing_bet == GameLogic::BETS[:PAPER]
    end
  end
end
