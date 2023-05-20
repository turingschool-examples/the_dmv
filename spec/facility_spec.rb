require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
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
end

# REGISTERING A VEHICLE
RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe "Iteration 2" do
    it 'can add DMV service' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(["Vehicle Registration"])
    end

    it 'can check if DMV Registered Vehicles array & Collected Fees are empty' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'can register a new vehicle' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
    
    it 'should still have a nil registration date' do
      expect(@cruz.registration_date).to eq nil
    end

    it 'should now have a registration date & a plate type' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.date_registered).to eq(Date.today)
      expect(@cruz.plate_finder).to eq(:regular)
    end

    it 'can total fees collected from registration' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'can register more vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      # Here comes the 69 Camaro *vroom vroom*
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today)

      # Here comes the EV Bolt *bzzZzzz*
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_finder).to eq(:ev)

      # There's 3 cars registered
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])

      # The fees total after 3 vehicles have been registered
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'can create a new facility with empty attributes' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end
end

# GETTING A DRIVERS LICENSE
RSpec.describe Facility do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
  end
  describe "Iteration 2" do
    it 'Registrants and Facilities exist' do
      expect(@registrant_1).to be_an_instance_of(Registrant) 
      expect(@registrant_2).to be_an_instance_of(Registrant) 
      expect(@registrant_3).to be_an_instance_of(Registrant)
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_2).to be_an_instance_of(Facility)
    end

    it 'cannot administer written test without service' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to eq true
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'now has Written Test Service and can administer test' do
      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Written Test'])

      @facility_1.administer_written_test(@registrant_1)
      require 'pry'; binding.pry
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end
end