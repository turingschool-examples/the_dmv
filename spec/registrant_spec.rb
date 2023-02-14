require 'spec_helper'

RSpec.describe Registrant do

  describe '#initialize' do
    it 'can initialize' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 15)

      expect(registrant_1).to be_a(Registrant)
      expect(registrant_2).to be_a(Registrant)
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#permit?' do
    it 'can have a permit' do
      registrant_1 = Registrant.new('Bruce', 18, true)

      expect(registrant_1.permit?).to be true
    end

    it 'defaults to no permit' do
      registrant_2 = Registrant.new('Penny', 15)

      expect(registrant_2.permit?).to be false
    end
  end

  describe '#earn_permit' do
    it 'allows a registrant to earn a permit' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 15)

      expect(registrant_2.permit?).to be false

      registrant_2.earn_permit

      expect(registrant_2.permit?).to be true
    end
  end

  describe '#passed_written_test?' do
    it 'returns true if the registrant has passed the written test' do
      registrant_1 = Registrant.new('Person 1', 18)
      registrant_2 = Registrant.new('Person 2', 18)
      registrant_2.license_data[:written] = true

      expect(registrant_1.passed_written_test?).to be false
      expect(registrant_2.passed_written_test?).to be true
    end
  end

  describe '#passed_road_test?' do
    it 'returns true if the registrant has passed the road test' do
      registrant_1 = Registrant.new('Person 1', 18)
      registrant_2 = Registrant.new('Person 2', 18)
      registrant_2.license_data[:written] = true
      registrant_2.license_data[:license] = true

      expect(registrant_1.passed_road_test?).to be false
      expect(registrant_2.passed_road_test?).to be true
    end
  end
end
