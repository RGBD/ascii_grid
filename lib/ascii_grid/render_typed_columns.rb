module AsciiGrid
  class RenderTypedColumns
    def call(rows:, column_types:)
      rows = rows.map { |row| row.zip(column_types).map { |value, type| type.new(value) } }
      Render.new.call(rows: rows)
    end
  end
end
