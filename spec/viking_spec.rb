require 'viking'

describe Viking do

	let(:viking) { Viking.new }

	describe '#initialize' do
		it 'passing name sets name attribute' do
			viking = Viking.new("Bob")
			expect(viking.name).to eq("Bob")
		end

		it 'passing health sets health attribute' do
			viking = Viking.new(name = "bob" , health = 50)
			expect(viking.health).to eq(50)
		end

		it 'health cannot be overwritten after being set' do
			viking = Viking.new(name = "bob" , health = 50)
			expect{ viking.health = 99 }.to raise_error
		end

		it 'viking weapon starts out nil by default' do
			expect(viking.weapon).to eq nil
		end

	end

	describe '#pick_up_weapon' do

		it 'picking up weapon sets it as viking weapon' do
			weapon = Bow.new
			viking.pick_up_weapon(weapon)
			expect(viking.weapon).to eq(weapon)
		end

		it 'picking up non-weapon raises error' do
			expect { viking.pick_up_weapon('banana') }.to raise_error
		end

	end

	describe '#drop_weapon' do 
		it 'dropping weapon leaves viking weaponless' do
			viking.pick_up_weapon(Bow.new)
			viking.drop_weapon
			expect(viking.weapon).to eq(nil)
		end
	end
end