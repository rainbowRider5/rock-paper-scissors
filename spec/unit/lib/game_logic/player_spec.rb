# frozen_string_literal: true

require "rails_helper"

module GameLogic
  RSpec.describe Player do
    describe "#new" do
      subject(:method_call) { described_class.new(*params) }
      let(:params) { ["John", "ROCK"] }

      it("correctly initializes class instance") { is_expected.to have_attributes(name: "John", bet: "ROCK") }
    end
  end
end
