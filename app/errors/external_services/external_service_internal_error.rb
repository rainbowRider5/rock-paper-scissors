# frozen_string_literal: true

module ExternalServices
  class ExternalServiceInternalError < ExternalServiceError
    def message
      "External service responded with internal server error"
    end
  end
end
