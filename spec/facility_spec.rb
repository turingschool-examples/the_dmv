require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@bolt).to be_an_instance_of(Vehicle)
      expect(@camaro).to be_an_instance_of(Vehicle)
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      expect(@facility_1.services).to eq(['New Drivers License'])
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 
      'Vehicle Registration','Written Test'])
      expect(@facility_2.services).to eq([])
    end
  end

  describe '#register vehicle and collect fees' do
   it 'can register a vehicle and collect fees' do
     expect(@facility_1.registered_vehicles).to eq([]) 
     expect(@facility_1.collected_fees).to eq(0)
     
     expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
     expect(@facility_1.registered_vehicles).to eq([@cruz])
     expect(@facility_1.collected_fees).to eq(100)
     
     expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @camaro])
     expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
     expect(@facility_1.collected_fees).to eq(125)
      
     expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])
     expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
     expect(@facility_1.collected_fees).to eq(325)

    #  expect(@facility_2.registered_vehicles).to eq([])
    #  expect(@facility_2.services).to eq([])
    #  expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
    #  expect(@facility_2.registered_vehicles).to eq([])
    #  expect(@facility_2.collected_fees).to eq(0)
    end
  end
end
