# frozen_string_literal: true

class GameController < ApplicationController
  def play
    outcome = PlayWithCurbAction.execute(game_params[:bet])
    @verdict = outcome.verdict
    @winner_name = outcome.winner&.name
    @winning_bet = outcome.winning_bet
  end

  private

  def validate_params
    raise InvalidParamError, :bet if GameLogic::BETS.values.exclude?(game_params[:bet])
  end

  def game_params
    params.permit(:bet)
  end
end
