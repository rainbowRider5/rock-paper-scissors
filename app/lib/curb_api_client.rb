# frozen_string_literal: true

class CurbApiClient
  include HTTParty
  base_uri "https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com"

  def throw!
    response = self.class.get("/rps-stage/throw")

    raise ExternalServices::ExternalServiceInternalError if response.code == 500

    extract_body(response)
  rescue Net::OpenTimeout
    raise ExternalServices::ExternalServiceTimeoutError
  end

  private

  def extract_body(response)
    response.body["body"]
  end
end
