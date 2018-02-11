require "spec_helper"

module StringKataPlugin
  RSpec.describe StringCalculator do
    describe ".add" do
      it "returns 0 for an empty string" do
        expect(StringCalculator.add("")).to be(0)
      end

      it "returns the value of a single number" do
        expect(StringCalculator.add("3")).to be(3)
      end

      it "adds two numbers separated by a comma" do
        expect(StringCalculator.add("1,2")).to be(3)
        expect(StringCalculator.add("0,10")).to be(10)
      end

      it "adds many numbers" do
        expect(StringCalculator.add("1,2,3,4,5")).to be(15)
      end
    end
  end
end
