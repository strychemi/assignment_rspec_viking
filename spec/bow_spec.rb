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

  describe '#use' do
    it 'using a bow reduces arrows by 1' do
    	bow.use
    	expect(bow.arrows).to eq(9)
    end
  	
  	it 'returns error if arrow count is 0' do
  		new_bow = Bow.new(0)
  		expect{new_bow.use}.to raise_error(RuntimeError)
  	end
  end
end
