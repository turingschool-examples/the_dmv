require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_new = Facility.new({name: nil, address: nil, phone: nil})
    @facility   = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'})
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'})
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)
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

  describe "Vehicle Registration" do
    it "adds service for facility_1" do
      @facility_1.add_service("Vehicle Registration")
      expect(@facility_1.services).to eq(["Vehicle Registration"])
    end

    it "checks cruz registration date" do
      expect(@cruz.registration_date).to eq(nil)
    end

    it "registers a vehicle at facility_1" do
      @facility_1.add_service("Vehicle Registration")
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.collected_fees).to eq(100)
    end

    it "registers a second vehicle" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
    end

    it "registers a third vehicle" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.collected_fees).to eq(325)
    end

    it "tries to register a vehicle at facility_2" do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe "Administering the written test" do
    it "checks registrant_1 license data" do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to eq(true)
    end

    it "tries to administer a written test for registrant_1" do
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it "adds 'Written Test' service to facility_1" do
      @facility_1.add_service("Written Test")
      expect(@facility_1.services).to eq(["Written Test"])
    end

    it "administers the written test to registrant_1" do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it "checks registrant_2 license data" do
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)
    end

    it "administers written test to registrant_2" do
      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)

      @registrant_2.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it "checks registrant_3 license data" do
      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
    end

    it "registrant_3 tries to get the written test" do
      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)

      @registrant_3.earn_permit
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "Administering the road test"do
    it "registrant_3 tries the road test" do
      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)

      @registrant_3.earn_permit
      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it "adds Road Test to facility_1" do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)

      @facility_1.add_service("Road Test")
      expect(@facility_1.services).to eq(["Written Test", "Road Test"])

      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

    it "registrant_2 completes road test" do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)

      expect(@facility_1.administer_road_test(@registrant_2)).to eq(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe "Renew license" do
    it "adds service to facility_1" do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_2)
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_written_test(@registrant_2)

      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)

      @facility_1.add_service("Renew License")
      expect(@facility_1.services).to eq(["Written Test", "Road Test", "Renew License"])

      @facility_1.renew_drivers_license(@registrant_1)
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end

    it "renews license for other registrants" do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @facility_1.add_service("Renew License")
      @registrant_2.earn_permit
      @facility_1.administer_road_test(@registrant_2)
      @facility_1.administer_written_test(@registrant_2)

      @facility_1.renew_drivers_license(@registrant_3)
      expect(@facility_1.renew_drivers_license(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility_2.renew_drivers_license(@registrant_2)
      expect(@facility_1.renew_drivers_license(@registrant_2)).to eq(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end

  describe "creating new facilities from existing data sources" do
    it "creates Oregon facility" do
      @facility_new.create_facility_oregon(@or_dmv_office_locations)
      expect(@facility_new.create_facility_oregon(@or_dmv_office_locations)).to be_an(Array)
    end

    it "creates New York facility" do
      @facility_new.create_facility_ny(@new_york_facilities)
      expect(@facility_new.create_facility_ny(@new_york_facilities)).to be_an(Array)
    end

    it "creates Missouri faciilty" do
        @facility_new.create_facility_missouri(@missouri_facilities)
        expect(@facility_new.create_facility_missouri(@missouri_facilities)).to be_an(Array)
    end
  end
end
