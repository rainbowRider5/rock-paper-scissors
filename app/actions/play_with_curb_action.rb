# frozen_string_literal: true

class PlayWithCurbAction < BaseAction
  class << self
    def execute(client_bet)
      client_player = GameLogic::Player.new("You", client_bet)
      crub_player = initialize_curb_player

      GameLogic::Round.new(client_player, crub_player).play!
    end

    private

    def initialize_curb_player
      crub_response = CurbApiClient.new.throw!

      GameLogic::Player.new("Curb", crub_response.upcase)
    rescue ExternalServices::ExternalServiceError
      player = GameLogic::Player.new("Curb")

      player.set_random_bet
      player
    end
  end
end
