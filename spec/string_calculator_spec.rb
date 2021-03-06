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

      it "adds numbers separated by a newline" do
        expect(StringCalculator.add("1\n2,3")).to be(6)
      end

      it "adds with a custom delimiter" do
        expect(StringCalculator.add("//;\n4;2")).to be(6)
      end

      context "with negative numbers" do
        it "raises an exception" do
          expect do
            StringCalculator.add("1,4,-1")
          end.to raise_error(ArgumentError, "negatives not allowed: -1")
        end

        context "when there are multiple negative numbers" do
          it "show all the numbers in the message" do
            expect do
              StringCalculator.add("-1,3,-2")
            end.to raise_error(ArgumentError, "negatives not allowed: -1, -2")
          end
        end
      end

      context "when descriptoion includes big numbers" do
        it "ignores the big numbers" do
          expect(StringCalculator.add("1001,2")).to be(2)
          expect(StringCalculator.add("1000,2")).to be(1002)
        end
      end
    end
  end
end
