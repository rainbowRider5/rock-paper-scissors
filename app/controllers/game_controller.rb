# frozen_string_literal: true

class GameController < ApplicationController
  def play
    @outcome, @winning_bet, @winner = PlayWithCurbAction.execute(game_params[:bet]).values_at(
      :outcome, :winning_bet, :winner
    )
  end

  private

  def validate_params
    raise InvalidParamError, :bet if GameLogic::Throw::BETS.values.exclude?(game_params[:bet])
  end

  def game_params
    params.permit(:bet)
  end
end
