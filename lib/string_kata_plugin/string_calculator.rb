module StringKataPlugin
  module StringCalculator
    extend self

    DELIMITER_PREFIX = "//"

    def add(calculation)
      return 0 if calculation.empty?

      delimiter, delimited_numbers = extract_delimiter(calculation)

      numbers = extract_numbers(delimited_numbers, delimiter)

      validate_numbers!(numbers)

      sum(numbers)
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

    def extract_numbers(delimited_numbers, delimiter)
      delimited_numbers
        .split(delimiter)
        .map(&:to_i)
    end

    def validate_numbers!(numbers)
      negatives = numbers.select { |e| e < 0 }

      negatives_detected!(negatives) if negatives.any?
    end

    def negatives_detected!(negatives)
      message = "negatives not allowed: #{negatives.join(', ')}"

      raise ArgumentError, message
    end

    def sum(numbers)
      numbers.reduce(0, &:+)
    end
  end
end
