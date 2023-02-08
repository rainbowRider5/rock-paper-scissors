# frozen_string_literal: true

module ExternalServices
  class ExternalServiceError < StandardError
    def message
      "Unknown error occurred when connecting with the external service"
    end
  end
end
