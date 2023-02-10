# frozen_string_literal: true

class PlayWithCurbAction < BaseAction
  class << self
    def execute(client_bet)
      client_throw = GameLogic::Throw.new(client_bet)
      crub_throw = get_crub_throw
      outcome = client_throw.play!(crub_throw)

      # TODO: Refactor outcome to store winning bet and winner
      {
        outcome: outcome,
        winning_bet: outcome == GameLogic::Throw::OUTCOMES[:WIN] ? client_throw.bet : crub_throw.bet,
        winner: if outcome == GameLogic::Throw::OUTCOMES[:WIN]
                  'Client'
                elsif outcome == GameLogic::Throw::OUTCOMES[:LOSS]
                  'Crub'
                end,
      }
    end

    private

    def get_crub_throw
      crub_response = CurbApiClient.new.throw!

      GameLogic::Throw.new(crub_response.upcase)
    rescue ExternalServices::ExternalServiceError
      GameLogic::Throw.new_random
    end
  end
end
