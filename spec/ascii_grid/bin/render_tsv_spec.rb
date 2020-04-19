require 'open3'

RSpec.describe 'AsciiGrid::RenderTsv' do
  it "renders from tsv" do
    stdout, stderr, status = Open3.capture3('bin/render_tsv', fixture_path('bin/render_tsv/in.tsv'))
    expect(stdout).to eq(read_fixture('bin/render_tsv/out.txt'))
    expect(stderr).to be_empty
    expect(status.success?).to eq(true)
  end
end
