require "spec_helper"

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: "Albany DMV Office", address: "2242 Santiam Hwy SE Albany OR 97321", phone: "541-967-2014" })
  end
  describe "#initialize" do
    it "can initialize" do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq("Albany DMV Office")
      expect(@facility.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(@facility.phone).to eq("541-967-2014")
      expect(@facility.services).to eq([])
    end
  end

  describe "#add service" do
    it "can add available services" do
      expect(@facility.services).to eq([])
      @facility.add_service("New Drivers License")
      @facility.add_service("Renew Drivers License")
      @facility.add_service("Vehicle Registration")
      expect(@facility.services).to eq(["New Drivers License", "Renew Drivers License", "Vehicle Registration"])
    end
  end

  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe "#initialize" do
  it "it can initialize" do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_1).to eq(@facility_1)
      expect(@facility_2).to eq(@facility_2)
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@bolt).to be_an_instance_of(Vehicle)
      expect(@camaro).to be_an_instance_of(Vehicle)
      expect(@cruz).to eq(@cruz)
      expect(@bolt).to eq(@bolt)
      expect(@camaro).to eq(@camaro)
    end
  end
  describe '#facilities_registered_vehicles' do
    it 'can return list of vehicles' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
    end
  end
    
end
