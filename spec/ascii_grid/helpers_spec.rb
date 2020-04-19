RSpec.describe AsciiGrid::Helpers do
  it "format_money" do
    expect(described_class.format_number(-123456.7895)).to eq('-123,456.790')
    expect(described_class.format_number(123456.7895)).to eq('123,456.790')
  end
end
