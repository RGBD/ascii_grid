module AsciiGrid
  module Cell
    class Base
      def initialize(string)
        @strings = [string]
      end

      def width
        @strings.map(&:size).max
      end

      def height
        @strings.size
      end

      def line(index, _width)
        @strings[index].to_s
      end
    end

    class WordColumnCell < Base
      def initialize(string)
        @strings = string.split
      end
    end

    class RightAlignCell < Base
      def line(index, width)
        @strings[index].to_s.rjust(width)
      end
    end

    class MoneyCell < RightAlignCell
      def initialize(string)
        @strings = [Helpers::format_number(string, delimiter: ' ', precision: 2)]
      end
    end
  end
end
