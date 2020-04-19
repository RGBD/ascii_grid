RSpec.describe AsciiGrid::Cell do
  include described_class

  describe described_class::Base do
    it 'works' do
      word = 'foobar'
      cell = described_class.new(word)
      expect(cell.width).to eq(word.size)
      expect(cell.height).to eq(1)
      expect(cell.line(0, 10)).to eq(word)
      expect(cell.line(1, 10)).to eq('')
    end
  end

  describe described_class::WordColumnCell do
    it 'works' do
      word = 'foob a rs'
      cell = described_class.new(word)
      expect(cell.width).to eq(4)
      expect(cell.height).to eq(3)
      expect(cell.line(0, 10)).to eq('foob')
      expect(cell.line(1, 10)).to eq('a')
      expect(cell.line(2, 10)).to eq('rs')
      expect(cell.line(3, 10)).to eq('')
    end
  end

  describe described_class::RightAlignCell do
    it 'works' do
      word = 'foobar'
      cell = described_class.new(word)
      expect(cell.width).to eq(6)
      expect(cell.height).to eq(1)
      expect(cell.line(0, 10)).to eq('    foobar')
      expect(cell.line(1, 10)).to eq('          ')
    end
  end

  describe described_class::MoneyCell do
    it 'works' do
      word = '+1234.567'
      cell = described_class.new(word)
      expect(cell.width).to eq(8)
      expect(cell.height).to eq(1)
      expect(cell.line(0, 10)).to eq('  1 234.57')
      expect(cell.line(1, 10)).to eq('          ')
    end
  end
end
