require 'spec_helper'
require './lib/facility'
require './lib/vehicle'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
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

describe '#check cruz.registration_date' do
  it 'checks registration date of cruz' do
    expect(@cruz.registration_date).to eq(nil)
  end
end

  describe '#check F1 vehicles' do
    it 'checks registered_vehicles for facility_1' do
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#check F1 collected fees' do
    it 'checks collected fees for facility_1' do
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register cruz and check info' do
    it 'registers cruz and checks info' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      #require the facility to have the service you're performing
    end
  end

  #decided not to make a test for my helper method `set_plate_type` 
  #because those tests are relevant and included in my other tests

  describe '#F1 registered vehicles' do
    it 'checks registered vehicles in facility_1' do
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      #require the facility to have the service you're performing
    end
  end

  describe '#F1 collected fees' do
    it 'checks collected fees in facility_1' do
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe '#register camaro and check info' do
    it 'registers camaro and checks info' do
      expect(@camaro).to be_an_instance_of(Vehicle)
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
      #require the facility to have the service you're performing
    end
  end

  describe '#register bolt and check info' do
    it 'registers bolt and checks info' do
      expect(@bolt).to be_an_instance_of(Vehicle)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      #require the facility to have the service you're performing
    end
  end

  describe '#check F1 registered vehicles and fees again' do
    it 'checks the registered vehicles after all three are added' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#check facility_2 details' do
    it 'checks the vehicles, services and fees of facility_2' do
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
    end
  end
end
