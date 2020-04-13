RSpec.describe AsciiGrid::Render do
  let(:rows) do
    <<~MSG.strip.split(/\s+/).each_slice(3).to_a
      A    quick brown
      fox  jumps over
      a    lazy  dog
      just in    time
    MSG
  end

  let(:expected_result) do
    <<~TABLE
      +----+-----+-----+
      |A   |quick|brown|
      +----+-----+-----+
      |fox |jumps|over |
      +----+-----+-----+
      |a   |lazy |dog  |
      +----+-----+-----+
      |just|in   |time |
      +----+-----+-----+
    TABLE
  end

  it "#calc_widths" do
    expect(subject.calc_widths(rows)).to eq([4, 5, 5])
  end

  it "#build_row_separator" do
    expect(subject.build_row_separator([0, 1, 2])).to eq('++-+--+')
  end

  it "#build_row" do
    expect(subject.build_row(['a', 'quick'], [4, 5])).to eq('|a   |quick|')
  end

  it "#call" do
    expect(subject.call(rows: rows)).to eq(expected_result)
  end
end

