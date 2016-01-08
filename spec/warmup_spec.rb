require 'warmup'

describe 'warmup' do
	let(:warmup) { Warmup.new }
	
	describe '#gets_shout' do
		it 'will make user input uppercase' do 
			allow(warmup).to receive(:gets).and_return('return')
			expect(warmup.gets_shout).to eq 'RETURN'
		end
	end

	describe '#triple_size' do
		it 'returns triple array size' do
			test_array = double(:size => [1,2,3])
			expect(warmup.triple_size(test_array)).to eq [1,2,3,1,2,3,1,2,3]
		end
	end
end