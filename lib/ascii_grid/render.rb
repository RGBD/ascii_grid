module AsciiGrid
  class Render
    def call(rows:)
      column_widths = calc_widths(rows)
      separator = build_row_separator(column_widths)
      rows_formatted = rows.map { |row| build_row(row, column_widths) }
      with_separators = rows_formatted.flat_map { |x| [separator, x] } + [separator]
      with_separators.map { |x| x + "\n" }.join
    end

    def build_row(row, column_widths)
      row.zip(column_widths).map { |value, width| '|' + value.ljust(width, ' ') }.join + '|'
    end

    def build_row_separator(column_widths)
      column_widths.map { |x| '+' + '-' * x }.join + '+'
    end

    def calc_widths(rows)
      return [] if rows.empty?

      Array.new(rows[0].size) do |i|
        rows.map { |x| x[i].size }.max
      end
    end
  end
end
