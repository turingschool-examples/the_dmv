require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'})
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520'})

    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('Albany DMV Office')
      expect(@facility_1.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility_1.phone).to eq('541-967-2014')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end

    it 'returns an array of strings' do
      expect(@facility_1.services).to be_a(Array)
      expect(@facility_1.services.all? { |service| service.is_a?(String) }).to be(true)
    end
  end

  describe '#registered_vehicles' do
    it 'starts empty' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'returns an array' do
      expect(@facility_1.registered_vehicles).to be_a(Array)
      expect(@facility_2.registered_vehicles).to be_a(Array)
    end

    describe '#collected_fees' do
      it 'starts at 0' do
        expect(@facility_1.collected_fees).to eq(0)
        expect(@facility_2.collected_fees).to eq(0)
      end

      it 'returns an integer' do
        expect(@facility_1.collected_fees).to be_a(Integer)
        expect(@facility_2.collected_fees).to be_a(Integer)
      end
    end
  end
end
