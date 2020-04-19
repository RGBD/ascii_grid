RSpec.describe AsciiGrid::RenderTypedColumns do
  let(:rows) do
    [
      ['foobar baz', '12.5', '-24683297.532'],
      ['ha ha', '12345678.9', '+153'],
    ]
  end

  let(:column_types) do
    [AsciiGrid::Cell::WordColumnCell, AsciiGrid::Cell::IntegerCell, AsciiGrid::Cell::MoneyCell]
  end

  let(:expected_result) do
    <<~TABLE
      +------+--------+--------------+
      |foobar|      12|-24 683 297,53|
      |baz   |        |              |
      +------+--------+--------------+
      |ha    |12345678|        153,00|
      |ha    |        |              |
      +------+--------+--------------+
    TABLE
  end

  it "#call" do
    expect(subject.call(rows: rows, column_types: column_types)).to eq(expected_result)
  end
end
