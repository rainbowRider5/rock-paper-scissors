# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(PlayWithCurbAction) do
  describe "#execute" do
    subject(:method_call) { described_class.execute(client_bet) }
    let(:client_bet) { 'ROCK' }

    context "when ExternalSerivceError is raised" do
      let(:curb_client_mock) { instance_double(CurbApiClient) }

      before do
        allow(CurbApiClient).to(receive(:new).and_return(curb_client_mock))
        allow(curb_client_mock).to(receive(:throw!).and_raise(ExternalServices::ExternalServiceInternalError))
        allow(GameLogic::Throw).to(receive(:new_random).and_call_original)
      end

      it "calls GameLogic::Throw.random to generate throw locally" do
        method_call

        expect(GameLogic::Throw).to(have_received(:new_random))
      end

      it("returns a valid outcome") { expect(GameLogic::Throw::OUTCOMES.values).to(include(method_call)) }
    end
  end
end
