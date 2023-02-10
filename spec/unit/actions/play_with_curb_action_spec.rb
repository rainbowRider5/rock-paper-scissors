# frozen_string_literal: true

require "rails_helper"

RSpec.describe(PlayWithCurbAction) do
  describe "#execute" do
    subject(:method_call) { described_class.execute(client_bet) }

    let(:client_bet) { "ROCK" }

    context "when ExternalServiceError is raised" do
      let(:curb_client_mock) { instance_double(CurbApiClient) }
      let(:curb_player) { instance_double(GameLogic::Player, name: "Curb", set_random_bet: "ROCK", bet: "ROCK") }

      before do
        allow(CurbApiClient).to receive(:new).and_return(curb_client_mock)
        allow(curb_client_mock).to receive(:throw!).and_raise(ExternalServices::ExternalServiceInternalError)
        allow(GameLogic::Player).to receive(:new).and_wrap_original do |original, *args|
          args.first == "Curb" ? curb_player : original.call(*args)
        end
      end

      it "calls GameLogic::Player.set_random_bet to" do
        method_call

        expect(curb_player).to have_received(:set_random_bet)
      end

      it("returns a valid outcome") { expect(method_call).to be_an_instance_of(GameLogic::Outcome) }
    end
  end
end
