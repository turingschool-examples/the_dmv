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

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle' do
    it 'can register vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.services).to eq(['Vehicle Registration'])
      
    end
  end

  describe '#registered_vehicles' do
    it 'can add vehicles to a list after they are registered' do
      expect(@facility_1.registered_vehicles).to eq([])
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'can add more than one vehicle to the list' do
      expect(@facility_1.registered_vehicles).to eq([])
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)


      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt])
    end
  end

  describe '#collected_fees' do
    it 'can add registration fee to collected_fees' do
      expect(@facility_1.collected_fees).to be 0
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to be 300
    end
  end

  describe '#registration_date' do
    it 'can add a registration date to vehicle data' do
      expect(@cruz.registration_date).to eq(nil)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe '#plate_type' do
    it 'can create a plate type for vehicle when registered' do
      expect(@cruz.plate_type).to eq(nil)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq(:regular)
    end
  end

  describe '#administer_written_test' do
    it 'can administer a written test to registrant that has permit and is 16 or over' do
      expect(@facility_1.services).to eq([])
      expect(@facility_1.administer_written_test(@registrant_1)).to be false

      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)

      expect(@facility_1.services).to eq(['Written Test'])
      expect(@facility_1.administer_written_test(@registrant_1)).to eq true    
    end

    it 'will not administer written test if registrant does not have a permit' do
      expect(@facility_1.administer_written_test(@registrant_2)).to be false

      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_2)

      expect(@facility_1.administer_written_test(@registrant_2)).to be false

      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)

      expect(@facility_1.administer_written_test(@registrant_2)).to be true
    end

    it 'will not administer written test if registrant is under 16' do
      expect(@facility_1.administer_written_test(@registrant_3)).to be false

      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_3)

      expect(@facility_1.administer_written_test(@registrant_3)).to be false
    end
  end

  describe '#administer_road_test' do
    it 'can administer a road test if registrant has written test' do
      expect(@facility_1.services).to eq([])
      expect(@facility_1.administer_road_test(@registrant_1)).to be false

      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_1)

      expect(@facility_1.services).to eq(['Road Test'])
      expect(@facility_1.administer_road_test(@registrant_1)).to be true
    end

    it 'will not administer road test if registrant does not have written test' do
      expect(@facility_1.administer_road_test(@registrant_2)).to be false
      expect(@facility_1.administer_road_test(@registrant_3)).to be false

      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_3)

      expect(@facility_1.administer_road_test(@registrant_2)).to be false
      expect(@facility_1.administer_road_test(@registrant_3)).to be false
    end
  end

end


     
