# frozen_string_literal: true

require "rails_helper"

module GameLogic
  RSpec.describe(Throw) do
    describe "#random" do
      subject(:method_call) { described_class.random }

      it("returns a Throw instance") { is_expected.to(be_an_instance_of(described_class)) }
      it("returns an instance with a valid bet") { expect(described_class::BETS.values).to(include(method_call.bet)) }
    end

    describe "#new" do
      subject(:method_call) { described_class.new(bet) }

      context "when bet is invalid" do
        let(:bet) { "HAMMER" }

        it("raises an ArgumentError") { expect { method_call }.to(raise_error(ArgumentError)) }
      end

      context "when bet is valid" do
        let(:bet) { "ROCK" }

        it("returns an instance of Throw") { expect(method_call).to(be_an_instance_of(described_class)) }
      end
    end

    describe "#compare!" do
      subject(:method_call) { described_class.new(my_bet).compare!(opponent_throw) }

      context "when provided throw param is not an instance of Throw" do
        let(:my_bet) { "SCISSORS" }
        let(:opponent_throw) { "ROCK" }

        it("raises InvalidThrowError") { expect { method_call }.to(raise_error(InvalidThrowError)) }
      end

      context "when two same bets are being compared" do
        let(:my_bet) { "ROCK" }
        let(:opponent_throw) { described_class.new("ROCK") }

        it("returns DRAW") { is_expected.to(eq("DRAW")) }
      end

      context "when ROCK is being compared" do
        let(:my_bet) { "ROCK" }

        context "with SCISSORS" do
          let(:opponent_throw) { described_class.new("SCISSORS") }

          it("returns WIN for ROCK") { is_expected.to(eq("WIN")) }
        end

        context "with PAPER" do
          let(:opponent_throw) { described_class.new("PAPER") }

          it("returns LOSS for ROCK") { is_expected.to(eq("LOSS")) }
        end
      end

      context "when PAPER is being compared" do
        let(:my_bet) { "PAPER" }

        context "with SCISSORS" do
          let(:opponent_throw) { described_class.new("SCISSORS") }

          it("returns LOSS for PAPER") { is_expected.to(eq("LOSS")) }
        end

        context "with ROCK" do
          let(:opponent_throw) { described_class.new("ROCK") }

          it("returns WIN for PAPER") { is_expected.to(eq("WIN")) }
        end
      end

      context "when SCISSORS are being compared" do
        let(:my_bet) { "SCISSORS" }

        context "with ROCK" do
          let(:opponent_throw) { described_class.new("ROCK") }

          it("returns LOSS for SCISSORS") { is_expected.to(eq("LOSS")) }
        end

        context "with PAPER" do
          let(:opponent_throw) { described_class.new("PAPER") }

          it("returns WIN for SCISSORS") { is_expected.to(eq("WIN")) }
        end
      end
    end
  end
end
