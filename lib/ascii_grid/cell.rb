module AsciiGrid
  module Cell
    class Base
      def initialize(string)
        @string = string
      end

      def width
        @string.size
      end

      def height
        1
      end

      def line(index)
        [@string][index]
      end
    end
  end
end
