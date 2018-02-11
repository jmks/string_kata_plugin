module StringKataPlugin
  module StringCalculator
    extend self

    DELIMITER_PREFIX = "//"

    def add(numbers)
      return 0 if numbers.empty?

      delimiter, only_numbers = extract_delimiter(numbers)

      only_numbers
        .split(delimiter)
        .map(&:to_i)
        .reduce(0, &:+)
    end

    def extract_delimiter(numbers)
      if custom_delimiter?(numbers)
        extract_custom_delimiter(numbers)
      else
        [/[,\s]/, numbers]
      end
    end

    def custom_delimiter?(numbers)
      numbers.start_with?(DELIMITER_PREFIX)
    end

    def extract_custom_delimiter(numbers)
      prefix_with_delimiter, only_numbers = numbers.split("\n")

      [prefix_with_delimiter.sub(DELIMITER_PREFIX, ""), only_numbers]
    end
  end
end
