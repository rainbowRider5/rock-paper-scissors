# frozen_string_literal: true

class GameController < ApplicationController
  def play
    outcome = PlayWithCurbAction.execute(game_params[:bet])

    render(json: { outcome: outcome }, status: :ok)
  end

  private

  def validate_params
    raise InvalidParamError, :bet if GameLogic::Throw::BETS.values.exclude?(game_params[:bet])
  end

  def game_params
    params.permit(:bet)
  end
end
