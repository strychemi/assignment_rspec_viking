require 'viking'

describe Viking do

	let(:viking) { Viking.new("First") }

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
      viking2 = Viking.new("Second")
      expect(viking).to receive(:damage_with_fists).and_return(1)
      viking.attack(viking2)
    end

		it 'Fists multiplier times strength damage' do
			viking = Viking.new("HI", 100, 8)
			expect(viking.send(:damage_with_fists)).to eq(2)
		end

		it 'attacking with a weapon runs damage_with_weapon' do
			viking = Viking.new("Bob", 100, 10, Axe.new)
			viking2 = Viking.new
			expect(viking).to receive(:damage_with_weapon).and_return(7)
			viking.attack(viking2)
		end

		it 'attacking with a weapon deals damage equal to the Viking\'s strength times that Weapon\'s multiplier' do
			viking = Viking.new("Bob", 100, 10, Axe.new)
			expect(viking.send(:damage_with_weapon)).to eq(10)
		end

		it 'attacking using a Bow without enough arrows uses Fists instead' do
			viking = Viking.new("Bob", 100, 10, Bow.new(0))
			viking2 = Viking.new
			expect(viking).to receive(:damage_with_fists).and_return(99)
			viking.attack(viking2)
		end

		it 'killing a Viking raises an error' do
			viking2 = Viking.new("Die",10, 1)
			expect{ viking2.receive_attack(10) }.to raise_error(Exception, "Die has Died...")
		end
  end
end
