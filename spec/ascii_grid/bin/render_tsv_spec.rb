RSpec.describe 'AsciiGrid::RenderTsv' do
  it "renders from tsv" do
    result = `bin/render_tsv #{fixture_path('bin/render_tsv/in.tsv')}`
    expect(result).to eq(read_fixture('bin/render_tsv/out.txt'))
  end
end
