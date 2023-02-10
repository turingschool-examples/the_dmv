require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @person_1 = {
      name: 'Bruce',
      age: 18,
      permit: true
    }

    @person_2 = {
      name: 'Penny',
      age: 15
    }

    @registrant_1 = Registrant.new(@person_1[:name], @person_1[:age], @person_1[:permit])
    @registrant_2 = Registrant.new(@person_2[:name], @person_2[:age])
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_a(Registrant)
    end

    it 'can initialize without a permit argument' do
      expect(@registrant_2).to be_a(Registrant)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(@registrant_1.name).to eq(@person_1[:name])
    end

    it 'has a different name' do
      expect(@registrant_2.name).to eq(@person_2[:name])
    end
  end

  describe '#age' do
    it 'has an age' do
      expect(@registrant_1.age).to eq(@person_1[:age])
    end

    it 'has a different age' do
      expect(@registrant_2.age).to eq(@person_2[:age])
    end
  end

  describe '#permit?' do
    it 'has a permit' do
      expect(@registrant_1.permit?).to eq(true)
    end

    it 'does not have a permit' do
      expect(@registrant_2.permit?).to eq(false)
    end
  end

  describe '#license_data' do
    it 'is a hash' do
      expect(@registrant_1.license_data).to be_a(Hash)
    end

    it 'has a written key' do
      expect(@registrant_1.license_data.include?(:written)).to eq(true)
      expect(@registrant_2.license_data.include?(:written)).to eq(true)
    end

    it 'has a license key' do
      expect(@registrant_1.license_data.include?(:license)).to eq(true)
      expect(@registrant_2.license_data.include?(:license)).to eq(true)
    end

    it 'has a renewed key' do
      expect(@registrant_1.license_data.include?(:renewed)).to eq(true)
      expect(@registrant_2.license_data.include?(:renewed)).to eq(true)
    end

    it 'sets its default values correctly' do
      expected = {
        written: false,
        license: false,
        renewed: false
      }

      expect(@registrant_1.license_data).to eq(expected)
      expect(@registrant_2.license_data).to eq(expected)
    end
  end
end
