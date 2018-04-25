require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Patrick") }
  subject(:tiramisu) { Dessert.new("tiramisu", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(tiramisu.type).to eq("tiramisu")
    end

    it "sets a quantity" do
      expect(tiramisu.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(tiramisu.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "fifty", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      tiramisu.add_ingredient("rum")
      tiramisu.add_ingredient("lady fingers")
      tiramisu.add_ingredient("mascarpone cheese")
      expect(tiramisu.ingredients).to eq(["rum","lady fingers","mascarpone cheese"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      tiramisu.add_ingredient("rum")
      tiramisu.add_ingredient("lady fingers")
      tiramisu.add_ingredient("mascarpone cheese")
      tiramisu.mix!
      expect(tiramisu.ingredients).to_not eq(["rum","lady fingers","mascarpone cheese"])
    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      tiramisu.eat(25)
      expect(tiramisu.quantity).to eq(25)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { tiramisu.eat(51) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Patrick")
      expect(tiramisu.serve).to eq("Patrick has made 50 tiramisus!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(tiramisu)
      tiramisu.make_more
    end
  end
end
