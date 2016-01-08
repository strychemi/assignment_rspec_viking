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

    it 'picking up new weapon overwrites existing weapon'  do
      bow = Bow.new
      axe = Axe.new
      viking.pick_up_weapon(bow)
      viking.pick_up_weapon(axe)
      expect(viking.weapon).to eq(axe)
    end
  end

	describe '#drop_weapon' do 
		it 'dropping weapon leaves viking weaponless' do
			viking.pick_up_weapon(Bow.new)
			viking.drop_weapon
			expect(viking.weapon).to eq(nil)
		end
	end

  describe '#receive_attack' do
    it 'reduces viking\'s health by specified amount' do
      damage = 10
      viking.receive_attack(damage)
      expect(viking.health).to eq(90)
    end

    it 'calls take_damage method' do
      expect(viking).to receive(:take_damage)
      viking.receive_attack(10)
    end
  end

  describe '#attack' do
    it 'attacking another viking reduces target\'s health' do
      viking.pick_up_weapon(Bow.new)
      viking2 = Viking.new
      viking.attack(viking2)
      expect(viking2.health).to eq(80)
    end

    it 'attacking another viking calls take_damage method' do
      viking.pick_up_weapon(Bow.new)
      viking2 = Viking.new
      expect(viking2).to receive(:take_damage)
      viking.attack(viking2)
    end

    it 'attacking with no weapon uses fists' do
      viking2 = Viking.new
      allow(viking).to receive(:damage_with_fists)
      viking.attack(viking2)
    end
  end
end