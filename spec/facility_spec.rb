require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )

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

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle' do
    it 'starts with an empty list of registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'starts with 0 collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'can register a vehicle if the facility has that service' do
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
    
    it 'can add a registration date to a vehicle that is registered' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      
      expect(@cruz.registration_date).to be_an_instance_of(Date)
    end
    
    it 'can issue a plate type based on engine' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      
      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
    end
    
    it 'can collect fees when registering vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#administer_written_test' do
    it 'can administer written test if available' do
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to be false 

      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to be true
    end

    it 'can only administer written tests if registrant has permit' do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data[:written]).to be false
      
      @registrant_2.earn_permit

      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data[:written]).to be true
    end

    it 'cannot administer written tests if registrant is under the age of 16' do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_3)

      expect(@registrant_3.license_data[:written]).to be false
      
      @registrant_3.earn_permit
      @facility_1.administer_written_test(@registrant_3)

      expect(@registrant_3.license_data[:written]).to be false
    end
  end

  describe '#administer_road_test' do
    it 'can issue a Road test if available at facility and registrant has taken the written test' do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      
      expect(@registrant_1.license_data[:license]).to be false

      @facility_1.add_service("Road Test")
      @facility_1.administer_road_test(@registrant_1)

      expect(@registrant_1.license_data[:license]).to be true
    end
    
    it 'cannot issue Road test if registrant has not completed the written test' do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @registrant_2.earn_permit
      @facility_1.administer_road_test(@registrant_2)
      
      expect(@registrant_2.license_data[:license]).to be false
      
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)
      
      expect(@registrant_2.license_data[:license]).to be true
    end
  end
end
