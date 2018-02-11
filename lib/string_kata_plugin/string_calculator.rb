module StringKataPlugin
  module StringCalculator
    extend self

    def add(numbers)
      return 0 if numbers.empty?

      numbers
        .split(",")
        .map(&:to_i)
        .reduce(0, &:+)
    end
  end
end
