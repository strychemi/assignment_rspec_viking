require 'weapons/bow'

describe Bow do

  let(:bow) { Bow.new }

  describe '#initialize' do
    it 'a bow\'s arrow count is readable' do
      expect(bow.arrows).to eq(10)
    end

    it 'bow created with arrow has that many arrows' do
      bow = Bow.new(99)
      expect(bow.arrows).to eq(99)
    end
  end
end
