require "spec_helper"

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: "Albany DMV Office", address: "2242 Santiam Hwy SE Albany OR 97321", phone: "541-967-2014" })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq("Albany DMV Office")
      expect(@facility_1.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(@facility_1.phone).to eq("541-967-2014")
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe "#add_service" do
    it "can add available services" do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service("New Drivers License")
      @facility_1.add_service("Renew Drivers License")
      @facility_1.add_service("Vehicle Registration")
      expect(@facility_1.services).to eq(["New Drivers License", "Renew Drivers License", "Vehicle Registration"])
    end
  end

  describe "#register_vehicles" do
    it "can register a Vehicle if the Facility offers Vehicle Registration" do
      expect(@facility_1.services).to eq([])
      
      @facility_1.add_service("Vehicle Registration")
      expect(@facility_1.services).to eq(["Vehicle Registration"])
      
      expect(@facility_1.registered_vehicles).to eq([])
      
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])
    end
    
    it "cannot register a Vehicle if the Facility doesn't offer Vehicle Registration" do
      expect(@facility_1.services).to eq([])

      @facility_1.add_service("Renew Drivers License")
      expect(@facility_1.registered_vehicles).to eq(["Renew Drivers License"])

      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it "can assign a #registration_date to a Vehicle" do
      @facility_1.add_service("Vehicle Registration")

      expect(@cruz.registration_date).to be nil
      
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to be_a(Date)
    end
    
    it "can assign a #plate_type to a Vehicle" do
      @facility_1.add_service("Vehicle Registration")
      
      expect(@cruz.plate_type).to be nil
      
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
      
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
      
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)      
    end
    
    it "can collect $25 to register an :antique Vehicle" do
      @facility_1.add_service("Vehicle Registration")

      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)
    end

    it "can collect $200 to register an :ev Vehicle" do
      @facility_1.add_service("Vehicle Registration")

      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end

    it "can collect $100 to register all other Vehicles" do
      @facility_1.add_service("Vehicle Registration")

      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end
    
    it "can collect money from all different kinds of Vehicle" do
      @facility_1.add_service("Vehicle Registration")

      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)

      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(125)

      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe "#administer_written_test" do

  end

  describe "#administer_road_test" do

  end
  
  describe "#renew_drivers_license" do

  end

end
