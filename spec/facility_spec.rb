require 'spec_helper'
require './lib/facility'
require './lib/vehicle'

RSpec.configure do |config|
  config.formatter = :documentation
end

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
      expect(@facility_1).to be_an_instance_of(Facility)  
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
      expect(@facility_2).to be_an_instance_of(Facility)  
      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
     
    end
  end


  describe '#add_service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Vehicle Registration')
      @facility_2.add_service('New Drivers License')
      @facility_2.add_service('Renew Drivers License')
      @facility_2.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License'])
      expect(@facility_1.services).to eq(['New Drivers License', 'Vehicle Registration'])
      expect(@facility_2.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end   
  end

  describe '#register_vehicle' do
    it 'can register vehicles' do
      expect(@facility_1.register_vehicle(@cruz)).to eq(nil)
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@cruz.plate_type).to eq(nil)
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.collected_fees).to eq(0)
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@cruz.plate_type).to eq(:regular)
      expect(@cruz.registration_date).not_to eq(nil)
      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_1.registered_vehicles).to eq([@cruz]) 

      expect(@camaro.plate_type).to eq(nil)
      expect(@camaro.registration_date).to eq(nil)
      expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @camaro])
      expect(@camaro.plate_type).to eq(:antique)
      expect(@camaro.registration_date).not_to eq(nil)
      expect(@facility_1.collected_fees).to eq(125)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro]) 

      expect(@bolt.plate_type).to eq(nil)
      expect(@bolt.registration_date).to eq(nil)
      expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])
      expect(@bolt.plate_type).to eq(:ev)
      expect(@bolt.registration_date).not_to eq(nil)
      expect(@facility_1.collected_fees).to eq(325)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt]) 
    end
  end   
end