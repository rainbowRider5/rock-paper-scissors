# frozen_string_literal: true

module GameLogic
  class InvalidThrowError < StandardError
    def message
      "Provided throw has invalid bet or no bet at all"
    end
  end
end
