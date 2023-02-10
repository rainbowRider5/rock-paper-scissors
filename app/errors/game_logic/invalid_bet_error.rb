# frozen_string_literal: true

module GameLogic
  class InvalidBetError < StandardError
    def message
      "Provided bet is not present or is invalid"
    end
  end
end
