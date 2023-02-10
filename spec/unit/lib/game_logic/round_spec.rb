# frozen_string_literal: true

require "rails_helper"

module GameLogic
  RSpec.describe Round do
    subject(:class_instance) { described_class.new(*players) }
    let(:players) { [Player.new("John"), Player.new("Maria")] }

    describe "#play!" do
      subject(:method_call) { class_instance.play! }

      context "when at least one players has invalid bet set" do
        it("raises InvalidBetError") { expect { method_call }.to raise_error(InvalidBetError) }
      end

      context "when both players selected same bet" do
        before { players.each { |player| player.bet = "ROCK" } }

        it("returns DRAW outcome for player1") do
          expect(method_call).to be_an_instance_of(Outcome).and have_attributes(draw_outcome_attributes)
        end
      end

      context "when player1 selected ROCK" do
        before { players.first.bet = "ROCK" }

        context "with player2 having selected SCISSORS" do
          before { players.second.bet = "SCISSORS" }

          it("returns WIN outcome for player1") do
            expect(method_call).to be_an_instance_of(Outcome).and have_attributes(win_outcome_attributes)
          end
        end

        context "with PAPER" do
          before { players.second.bet = "PAPER" }

          it("returns LOSS outcome for player1") do
            expect(method_call).to be_an_instance_of(Outcome).and have_attributes(loss_outcome_attributes)
          end
        end
      end

      context "when PAPER is being compared" do
        before { players.first.bet = "PAPER" }

        context "with SCISSORS" do
          before { players.second.bet = "SCISSORS" }

          it("returns LOSS for player1") do
            expect(method_call).to be_an_instance_of(Outcome).and have_attributes(loss_outcome_attributes)
          end
        end

        context "with ROCK" do
          before { players.second.bet = "ROCK" }

          it("returns WIN for player1") do
            expect(method_call).to be_an_instance_of(Outcome).and have_attributes(win_outcome_attributes)
          end
        end
      end

      context "when SCISSORS are being compared" do
        before { players.first.bet = "SCISSORS" }

        context "with ROCK" do
          before { players.second.bet = "ROCK" }

          it("returns LOSS outcome for player1") do
            expect(method_call).to be_an_instance_of(Outcome).and have_attributes(loss_outcome_attributes)
          end
        end

        context "with PAPER" do
          before { players.second.bet = "PAPER" }

          it("returns WIN outcome for player1") do
            expect(method_call).to be_an_instance_of(Outcome).and have_attributes(win_outcome_attributes)
          end
        end
      end
    end

    def draw_outcome_attributes
      { verdict: "DRAW", winner: nil, winning_bet: players.first.bet }
    end

    def win_outcome_attributes
      { verdict: "WIN", winner: players.first, winning_bet: players.first.bet }
    end

    def loss_outcome_attributes
      { verdict: "LOSS", winner: players.second, winning_bet: players.second.bet }
    end
  end
end
