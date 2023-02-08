# frozen_string_literal: true

module ExternalServices
  class ExternalServiceTimeoutError < ExternalServiceError
    def message
      "External service does not respond"
    end
  end
end
