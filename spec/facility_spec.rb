require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle(car)' do 
    it 'has no registered vehicles' do 
      expect(@facility_1.registered_vehicles).to eq([])
    end 
    
    it 'can tell if a vehicle was registered' do 
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility_1.register_vehicle(cruz)

      expect(@facility_1.registered_vehicles).to eq([cruz])
    end 
  
    it 'can give a date a vehicle is registered' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility_1.register_vehicle(cruz)

      expect(@facility_1.registered_vehicles.first.registration_date).to eq(Date.today)
    end
  
    it 'can give a plate type' do 
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility_1.register_vehicle(cruz)

      expect(@facility_1.registered_vehicles.first.plate_type(cruz)).to eq(:regular)
    end 
  
    it 'collects right fee amount' do 
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      
      @facility_1.register_vehicle(cruz)
      @facility_1.register_fee(cruz) 

      expect(@facility_1.collected_fees).to eq(100)
    end 
  end 
end
