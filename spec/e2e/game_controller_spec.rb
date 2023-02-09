# frozen_string_literal: true

require "rails_helper"

RSpec.describe(GameController, type: :request) do
  describe "#play" do
    subject(:request) { post "/play", params: { bet: bet_param } }

    context "when provided bet param is invalid" do
      let(:bet_param) { "HAMMER" }

      it "responds with proper error message" do
        request

        expect(response.body).to(include("Invalid input for the bet parameter"))
      end

      it "responds with proper status" do
        request

        expect(response).to(have_http_status(:bad_request))
      end
    end

    context "when provided bet param is valid" do
      let(:bet_param) { "PAPER" }

      it "responds with an valid outcome" do
        request

        expect(["WIN", "LOSS", "DRAW"]).to(include(parsed_response_body["outcome"]))
      end
    end
  end
end
