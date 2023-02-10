# frozen_string_literal: true

require "rails_helper"

module GameLogic
  RSpec.describe Outcome do
    describe "#new" do
      subject(:method_call) { described_class.new(**params) }
      let(:params) { { verdict: "WIN", winner: Player.new("Josh"), winning_bet: "ROCK" } }

      it("correctly initializes class instance") { is_expected.to have_attributes(**params) }
    end
  end
end
