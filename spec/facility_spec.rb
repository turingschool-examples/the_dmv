require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
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

  describe '#check facility_1(F1) vehicles' do
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
      @facility_1.add_service('Vehicle Registration')
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
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      #require the facility to have the service you're performing
    end
  end

  describe '#F1 collected fees' do
    it 'checks collected fees in facility_1' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe '#register camaro and check info' do
    it 'registers camaro and checks info' do
      expect(@camaro).to be_an_instance_of(Vehicle)
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
      #require the facility to have the service you're performing
    end
  end

  describe '#register bolt and check info' do
    it 'registers bolt and checks info' do
      @facility_1.add_service('Vehicle Registration')
      expect(@bolt).to be_an_instance_of(Vehicle)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      #require the facility to have the service you're performing
    end
  end

  describe '#check F1 registered vehicles and fees again' do
    it 'checks the registered vehicles after all three are added' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#check facility_2(F2) details' do
    it 'checks the vehicles, services and fees of facility_2' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
    end
  end

  describe '#add bolt and check F2 details again' do 
    it 'registers bolt and checks F2 details again' do 
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
      # expect(facility_2.registered_vehicles).to eq([])
      # expect(facility_2.collected_fees).to eq(0)
    end
  end

  describe '#written test' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 16)
      @registrant_3 = Registrant.new('Tucker', 15)
    end


    it 'facility needs the service to administer a written test' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to be true
      expect(@facility_1.administer_written_test(@registrant_1)).to be false
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'adds written test to facility_1' do
      @facility_1.add_service('Written Test')
      expect(@facility_1.check_for_service('Written Test')).to be true
    end

    it 'administers written test to reg_1' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to be true
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'checks reg_2 information and tries to administer a written test' do
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to be false
      expect(@facility_1.administer_written_test(@registrant_2)).to be false
    end

    it 'reg_2 earns permit' do
      @facility_1.add_service('Written Test')
      @registrant_2.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to be true
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end
end