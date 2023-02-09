# frozen_string_literal: true

class PlayWithCurbAction < BaseAction
  class << self
    def execute(client_bet)
      client_throw = GameLogic::Throw.new(client_bet)

      client_throw.compare!(crub_throw)
    end

    private

    def crub_throw
      crub_response = CurbApiClient.new.throw!

      GameLogic::Throw.new(crub_response.upcase)
    rescue ExternalServices::ExternalServiceError
      GameLogic::Throw.new_random
    end
  end
end
