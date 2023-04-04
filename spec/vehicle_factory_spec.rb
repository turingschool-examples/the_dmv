require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe Vehicle do
  before(:each) do
    @factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    require 'pry'; binding.pry
  end

  describe "Vehicle Factory" do
    it "exists" do 
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe "creates vehicles" do
    it "gets model from database and creates vehicle" do
      expect(factory.create_vehicles(wa_ev_registrations)
    end
  end





end