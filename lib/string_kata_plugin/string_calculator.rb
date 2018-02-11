module StringKataPlugin
  module StringCalculator
    extend self

    def add(numbers)
      return 0 if numbers.empty?

      delimiter, only_numbers = extract_delimiter(numbers)

      only_numbers
        .split(delimiter)
        .map(&:to_i)
        .reduce(0, &:+)
    end

    def extract_delimiter(numbers)
      [/[,\s]/, numbers]
    end
  end
end
