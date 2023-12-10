require 'spec_helper'
require 'date'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle(cruz)' do
    it 'registers a vehicle' do

      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.register_vehicle(@cruz)).to eq(@facility_1.registered_vehicles)
    end
  end

  describe '#register_vehicle(bolt)' do
    it 'registers (bolt)' do

      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.register_vehicle(@bolt)).to eq(@facility_1.registered_vehicles)
    end
  end

  describe '#register_vehicle(camaro)' do

    it 'registers (camaro)' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.register_vehicle(@camaro)).to eq(@facility_1.registered_vehicles)
    end
  end

  describe '#set_plate_type' do
    it 'returns the plate type' do
      @facility_1.registered_vehicles

      expect(@facility_1.set_plate_type(@cruz)).to eq(:regular)
      expect(@facility_1.set_plate_type(@bolt)).to eq(:ev)
      expect(@facility_1.set_plate_type(@camaro)).to eq(:antique)
    end
  end
end
