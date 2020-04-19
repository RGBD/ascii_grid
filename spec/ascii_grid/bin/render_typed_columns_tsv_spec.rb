require 'open3'

RSpec.describe 'bin/render_typed_columns_tsv' do
  it "renders from tsv" do
    stdout, stderr, status =
      Open3.capture3('bin/render_typed_columns_tsv', fixture_path('bin/render_typed_columns_tsv/in.tsv'), ';')
    expect(stderr).to be_empty
    expect(status.success?).to eq(true)
    expect(stdout).to eq(read_fixture('bin/render_typed_columns_tsv/out.txt'))
  end
end
