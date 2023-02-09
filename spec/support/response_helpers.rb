# frozen_string_literal: true

module ResponseHelpers
  def parsed_response_body
    JSON.parse(response.body)
  end
end
