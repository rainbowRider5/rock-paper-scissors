# frozen_string_literal: true

class InvalidParamError < StandardError
  def initialize(param_name)
    super()
    @param_name = param_name
  end

  def message
    "Invalid input for the #{param_name} parameter"
  end

  private

  attr_reader :param_name
end
