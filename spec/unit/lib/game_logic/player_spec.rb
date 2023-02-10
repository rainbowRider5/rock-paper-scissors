# frozen_string_literal: true

require "rails_helper"

module GameLogic
  RSpec.describe Player do
    describe "#new" do
      subject(:method_call) { described_class.new(bet) }
      let(:bet) { "ROCK" }

      it("correctly initializes class instance") { is_expected.to have_attributes(bet: bet) }
    end
  end
end
