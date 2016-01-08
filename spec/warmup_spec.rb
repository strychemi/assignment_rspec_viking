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
			test_array = double(:size => 3)
			expect(warmup.triple_size(test_array)).to eq 9
		end
	end

	describe '#calls_some_methods' do
		it 'receives upcase! method call' do
			test_string = "hello"
			expect(test_string).to receive(:upcase!).and_return("HELLO")
			warmup.calls_some_methods(test_string)
		end

		it 'receives reverse! method call' do
			test_string = "hello"
			expect(test_string).to receive(:reverse!)
			warmup.calls_some_methods(test_string)
		end

		it 'returns string unrelated to one passed in' do
			expect(warmup.calls_some_methods("hello")).to eq("I am unrelated")
		end
	end
end
