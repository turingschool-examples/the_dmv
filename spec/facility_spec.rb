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

  
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  

    it 'can add a service and check registration_date' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['Vehicle Registration'])
      expect(@cruz.registration_date).to be nil
    end

    it 'starts with no registered vehicles or fees' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'has a vehicle that can be registered' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
     
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'has a registration date' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
    
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today) 
  end

    it 'has a plate type' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq(:regular)
    end

    it 'collects fees for plates upon registration' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'can register the camaro' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)

      expect(@camaro.registration_date).to eq(Date.today) 
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
    end

    it 'can register the bolt' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@bolt.registration_date).to eq(Date.today) 
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'facility_2 starts with no services, vehicles, or fees' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq("service not provided at this location")
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'verifies info needed for a license for registrant_1' do

      expected = {:written=>false, :license=>false, :renewed=>false}

      expect(@registrant_1.license_data).to eq(expected)
      expect(@registrant_1.permit?).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
    end
      
    it 'allows registrant_1 to be administered a written test' do
      @facility_1.add_service('Written_Test')

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)

      expected = {:written=>true, :license=>false, :renewed=>false}
  
      expect(@registrant_1.license_data).to eq(expected)
    end

    it 'verifies info needed for registrant_2 to take written test' do
      @facility_1.add_service('Written_Test')

      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
    end

    it 'registrant_2 can ear their permit and take written test' do
      @facility_1.add_service('Written_Test')
      @registrant_2.earn_permit

      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)

      expected = {:written=>true, :license=>false, :renewed=>false}
      expect(@registrant_2.license_data).to eq(expected)
    end

    it 'verfies info needed for registrant_3 to take written test' do
      @facility_1.add_service('Written_Test')

      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
    end

    it 'registrant_3 can earn their permit, but can not take written test' do
      @facility_1.add_service('Written_Test')
      @registrant_3.earn_permit

      expect(@registrant_3.permit?).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)

      expected = {:written=>false, :license=>false, :renewed=>false}

      expect(@registrant_3.license_data).to eq(expected)
    end

    it 'verifies registrant who does not meet requirements can not be administered a road test' do
      @facility_1.add_service('Written_Test')
      @facility_1.add_service('Road Test')
      
      expect(@facility_1.services).to match_array(['Written_Test', 'Road Test',])

      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)

      @registrant_3.earn_permit
      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)
    end

    it 'verifies registrants who meet requirements can be administered a road test' do
      @facility_1.add_service('Written_Test')
      @facility_1.add_service('Road Test')

      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)

      expected =  {:written=>true, :license=>true, :renewed=>false}
      expect(@registrant_1.license_data).to eq(expected)
    end

    it 'verifies a facility can renew a drivers license' do
      @facility_1.add_service('Written_Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew Drivers License')

      expect(@facility_1.services).to match_array(["Written_Test", "Road Test", "Renew Drivers License"])

      @registrant_1.administer_road_test
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
      # require 'pry'; binding.pry
      expect(@facility_1.renew_drivers_license(@registrant_2)).to eq(false)
      # require 'pry'; binding.pry


    end
  end
