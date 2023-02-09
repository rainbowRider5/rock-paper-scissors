# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :validate_params

  rescue_from InvalidParamError, with: :bad_request_response

  private

  def validate_params
  end

  def bad_request_response(error)
    render(json: { error: error.message }, status: :bad_request)
  end
end
