module AsciiGrid
  module Helpers
    module_function

    def format_number(number, delimiter: ',', fraction_delimiter: '.', precision: 3)
      number = Float(number).round(precision)
      formatted = format('%.*f', precision, number)
      integer, fraction = formatted.split('.')
      sign_regex = /\A([-+])/
      sign = integer[sign_regex, 1]
      integer = integer.sub(sign_regex, '')
      integer = integer.reverse.chars.each_slice(3).map(&:join).join(delimiter).reverse
      "#{sign}#{integer}#{fraction_delimiter}#{fraction}"
    end
  end
end
