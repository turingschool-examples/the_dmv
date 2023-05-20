require "spec_helper"

describe "VehicleFactory" do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe "#initialize" do
    it "exists" do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe "#create_vehicles" do
    it "returns an array of Vehicles" do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      first_ev = vehicles.first
      
      # require "pry"; binding.pry
      expect(vehicles).to be_a(Array)

      expect(first_ev).to be_a(Vehicle)
      expect(first_ev.vin).to eq("7SAYGDEF6N")
      expect(first_ev.year).to eq("2022")
      expect(first_ev.make).to eq("TESLA")
      expect(first_ev.model).to eq("Model Y")
      expect(first_ev.engine).to eq(:ev)
      expect(first_ev.plate_type).to eq(nil)
      expect(first_ev.registration_date).to eq(nil)
    end
  end

end


