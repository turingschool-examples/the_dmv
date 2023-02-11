require 'spec_helper'

RSpec.describe Registrant do
  PERSON_1 = {
    name: 'Bruce',
    age: 18,
    permit: true
  }.freeze
  PERSON_2 = {
    name: 'Penny',
    age: 16
  }.freeze
  PERSON_3 = {
    name: 'Tucker',
    age: 15
  }.freeze

  before(:each) do
    @registrant_1 = Registrant.new(PERSON_1[:name], PERSON_1[:age], PERSON_1[:permit])
    @registrant_2 = Registrant.new(PERSON_2[:name], PERSON_2[:age])
    @registrant_3 = Registrant.new(PERSON_3[:name], PERSON_3[:age])
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_a(Registrant)
    end

    it 'can still initialize without a permit argument' do
      expect(@registrant_2).to be_a(Registrant)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(@registrant_1.name).to eq(PERSON_1[:name])
    end

    it 'has a different name' do
      expect(@registrant_2.name).to eq(PERSON_2[:name])
    end

    it 'returns a string' do
      expect(@registrant_1.name).to be_a(String)
      expect(@registrant_2.name).to be_a(String)
    end
  end

  describe '#age' do
    it 'has an age' do
      expect(@registrant_1.age).to eq(PERSON_1[:age])
    end

    it 'has a different age' do
      expect(@registrant_2.age).to eq(PERSON_2[:age])
    end

    it 'returns an integer' do
      expect(@registrant_1.age).to be_a(Integer)
      expect(@registrant_2.age).to be_a(Integer)
    end
  end

  describe '#permit?' do
    it 'has a permit' do
      expect(@registrant_1.permit?).to be(true)
    end

    it 'does not have a permit' do
      expect(@registrant_2.permit?).to be(false)
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
      expect(@registrant_1.license_data).to eq(Registrant::DEFAULTS[:license_data])
      expect(@registrant_2.license_data).to eq(Registrant::DEFAULTS[:license_data])
    end

    describe '#earn_permit' do
      it 'changes #permit? from false to true' do
        expect(@registrant_2.permit?).to be(false)
        @registrant_2.earn_permit
        expect(@registrant_2.permit?).to be(true)
      end

      it 'does nothing if #permit? is already true' do
        expect(@registrant_1.permit?).to be(true)
        @registrant_1.earn_permit
        expect(@registrant_1.permit?).to be(true)
      end

      it 'returns true' do
        expect(@registrant_1.earn_permit).to be(true)
      end
    end
  end
end
