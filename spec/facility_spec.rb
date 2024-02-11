require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
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
  
  describe '#Default attributes' do
    it 'can add vehicle registration' do
      expect(@facility.services).to eq([])
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['Vehicle Registration'])
     expect(@facility.registered_vehicles).to eq([])
     expect(@cruz.registration_date).to eq(nil)
     expect(@facility.collected_fees).to eq(0)
   end
 end

  describe'#Register vehicle' do 
    it 'Registers cruz' do 
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today.year)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility.registered_vehicles).to eq([@cruz])
      expect(@facility.collected_fees).to eq(100)
    end

    it 'Registers camaro and bolt' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today.year)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility.registered_vehicles).to eq([@cruz])
      expect(@facility.collected_fees).to eq(100)
    
      
      @facility.register_vehicle(@camaro)
      expect(@facility.registered_vehicles).to eq([@cruz, @camaro])
      expect(@camaro.registration_date).to eq(Date.today.year)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility.collected_fees).to eq(125)
  
      
   
      @facility.register_vehicle(@bolt)
      expect(@facility.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@bolt.registration_date).to eq(Date.today.year)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility.collected_fees).to eq(325)
       
    end
  end

  describe'#check facility and facility_1' do 
    it 'sees what is in the first facility' do 
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@camaro)
      @facility.register_vehicle(@bolt)
      expect(@facility.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end

    it 'facility 2 default' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
      
    end
  end
end     


