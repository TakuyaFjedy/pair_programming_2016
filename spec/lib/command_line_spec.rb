require "spec_helper"
require_relative "../../lib/command_line.rb"

describe "Dealer" do
  context 'when created stock' do
    aisaka = Dealer.new("相坂")
    stock = aisaka.create_stock
    it "number of cards is 52" do
      expect(stock.count).to eq(52)
    end
    context 'when deal card' do
      it "number of cards is 5" do
        hand = aisaka.deal
        expect(hand.count).to eq(5)
      end
    end
    # it "number of cards is 5" do
    #     expect(aisaka.foo()).to eq("foo")
    # end
  end
end