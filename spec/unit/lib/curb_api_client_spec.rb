# frozen_string_literal: true

require "rails_helper"

RSpec.describe(CurbApiClient) do
  subject(:class_instance) { described_class.new }

  describe "#throw!" do
    subject(:method_call) { class_instance.throw! }

    context "when api does not respond" do
      before { allow(described_class).to(receive(:get).and_raise(Net::OpenTimeout)) }

      it "raises an ExternalServices::ExternalServiceTimeoutError" do
        expect { method_call }.to(raise_error(ExternalServices::ExternalServiceTimeoutError))
      end
    end

    context "when api responds with 500 status" do
      let(:mocked_response) { instance_double(HTTParty::Response, code: 500) }

      before { allow(described_class).to(receive(:get).and_return(mocked_response)) }

      it "raises an ExternalServices::ExternalServiceTimeoutError" do
        expect { method_call }.to(raise_error(ExternalServices::ExternalServiceInternalError))
      end
    end

    context "when api responds with status other than 500" do
      let(:mocked_response) do
        instance_double(HTTParty::Response, code: 200, body: { "statusCode" => 200, "body" => "rock" })
      end

      before { allow(described_class).to(receive(:get).and_return(mocked_response)) }

      it "returns the response's body" do
        expect(method_call).to(eq("rock"))
      end
    end
  end
end
