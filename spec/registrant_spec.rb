require 'spec_helper'

RSpec.describe Registrant do
  let(:registrant_1) { Registrant.new('Bruce', 18, true ) }
  let(:registrant_2) { Registrant.new('Penny', 16) }
  let(:registrant_3) { Registrant.new('Tucker', 15) }
  let (:facility_1) { Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'}) }
  let (:facility_2) { Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'}) }
  describe 'initialize' do
    it 'can initialize' do
      expect(registrant_1).to be_an_instance_of(Registrant)
    end

    it 'can have a name' do
      expect(registrant_1.name).to eq('Bruce')

      expect(registrant_2.name).to eq('Penny')
    end

    it 'can have an age' do
      expect(registrant_1.age).to eq(18)

      expect(registrant_2.age).to eq(16)
    end

    it 'has no permit by default' do
      expect(registrant_2.permit?).to be false
    end

    it 'can have a permit when instantiated' do
      expect(registrant_1.permit?).to be true
    end

    it 'has not passed the written test, got their license or renewed their license by default' do
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe 'earning a permit' do
    it 'can earn a permit' do
      registrant_2.earn_permit

      expect(registrant_2.permit?).to be true
    end
  end

  describe 'test taking' do
    it 'can take (and pass) the written test only if they are 16 and have their permit; returns false otherwise' do
      expect(registrant_1.license_data[:written]).to be false
      expect(registrant_2.license_data[:written]).to be false
      expect(registrant_3.license_data[:written]).to be false

      # to show it returns true if registrant can take the test
      expect(registrant_1.take_written).to be true

      registrant_2.take_written

      # to show it returns false if registrant can't take the test
      expect(registrant_2.take_written).to be false
      
      registrant_3.take_written

      expect(registrant_1.license_data[:written]).to be true
      expect(registrant_2.license_data[:written]).to be false
      expect(registrant_3.license_data[:written]).to be false
    end

    it 'can take (and pass) the road test only if they have passed written; returns false otherwise' do
      expect(registrant_1.license_data[:written]).to be false
      expect(registrant_1.license_data[:license]).to be false

      # to show it returns false if registrant doesn't have written
      expect(registrant_1.take_road).to be false

      registrant_1.take_written

      expect(registrant_1.license_data[:written]).to be true

      # to show it returns true if registrant has their written
      expect(registrant_1.take_road).to be true

      expect(registrant_1.license_data[:license]).to be true
    end
  end
end