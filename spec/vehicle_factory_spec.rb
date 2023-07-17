require 'spec_helper'

describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe "#create_vehicles" do
    it "can add vehicles from the database" do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an Array
      expect(@factory.create_vehicles(@wa_ev_registrations)).to all be_a Vehicle
    end
  end

  describe "#top_make" do
    it "can find the top make" do
      @my_ev_registrations = [{"vin_1_10":"fakevin","model_year":"2020","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2020","make":"Tesla","model":"Model Y"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Tesla","model":"Model Y"}]
      @factory.create_vehicles(@my_ev_registrations)

      expect(@factory.top_make).to eq("Chevrolet")
    end
  end

  describe "#top_model" do
    it "can find the top model" do
      @my_ev_registrations = [{"vin_1_10":"fakevin","model_year":"2020","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2020","make":"Tesla","model":"Model Y"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Tesla","model":"Model Y"}]
      @factory.create_vehicles(@my_ev_registrations)

      expect(@factory.top_model).to eq("Bolt")
    end
  end

  describe "#model_year_count" do
    it "can return number of vehicles from a model year" do
      @my_ev_registrations = [{"vin_1_10":"fakevin","model_year":"2020","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Chevrolet","model":"Bolt"},
      {"vin_1_10":"fakevin","model_year":"2020","make":"Tesla","model":"Model Y"},
      {"vin_1_10":"fakevin","model_year":"2021","make":"Tesla","model":"Model Y"}]
      @factory.create_vehicles(@my_ev_registrations)

      expect(@factory.model_year_count(2021)).to eq(3)
    end
  end
end