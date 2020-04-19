module AsciiGrid
  class Render
    def call(rows:)
      validate_rows(rows)
      column_widths = calc_column_widths(rows)
      separator = build_row_separator(column_widths)
      rows_formatted = rows.map do |row|
        height = calc_row_height(row)
        height.times.map do |i|
          build_row(row, column_widths, i)
        end
      end
      with_separators = rows_formatted.flat_map { |x| [separator, *x] } + [separator]
      with_separators.map { |x| x + "\n" }.join
    end

    def validate_rows(rows)
      true
    end

    def build_row(row, column_widths, line)
      row.zip(column_widths).map { |value, width| '|' + value.line(line, width).ljust(width, ' ') }.join + '|'
    end

    def build_row_separator(column_widths)
      column_widths.map { |x| '+' + '-' * x }.join + '+'
    end

    def calc_row_height(row)
      row.map(&:height).max
    end

    def calc_column_widths(rows)
      return [] if rows.empty?

      Array.new(rows[0].size) do |i|
        rows.map { |x| x[i].width }.max
      end
    end
  end
end
