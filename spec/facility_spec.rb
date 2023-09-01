require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV NorthEast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
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
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'] )
    end
  end

  describe '#register_vehicle' do
    before(:each) do 
      @facility_1.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end
    
    it 'keeps an array for registered Vehicles' do
      expect(facility.registered_vehicles).to eq([])
    end 

    it 'keep track of collected_fees' do
      expect(facility.registered_vehicles).to eq(0)
    end

    it 'will add registered Vehicles to the array' do
      @facility_1.register_vehicle(cruz)
      expect(facility.registered_vehicles).to eq([cruz])
      @facility_1.register_vehicle(bolt)
      expect(facility.registered_vehicles).to eq([cruz, bolt])
    end

    it 'will give the Vehicle a registration date' do
      @facility_1.register_vehicle(cruz)
      expect(cruz.registration_date).to be_an_instance_of(Date)
    end

    it 'assigns plates by type' do
      @facility_1.register_vehicle(cruz)
      @facility_1.register_vehicle(bolt)
      expect(cruz.plate_type).to eq(:ice)
      expect(bolt.plate_type).to eq(:ev)
    end

      
      
end
