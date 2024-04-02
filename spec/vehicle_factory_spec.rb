require 'spec_helper'

RSpec.describe VehicleFactory do
  describe 'initialize' do
    it "can initialize" do
      vehicle_factory = VehicleFactory.new

      expect(vehicle_factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe 'create_vehicles' do
    it "can create cars from registrations" do
      vehicle_factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle = [{:electric_vehicle_type=>"Battery Electric Vehicle (BEV)", :vin_1_10=>"7SAYGDEE0P", :dol_vehicle_id=>"245533788", :model_year=>"2023", :make=>"TESLA", :model=>"Model Y", :vehicle_primary_use=>"Passenger", :electric_range=>"0", :odometer_reading=>"0", :odometer_code=>"Odometer reading is not collected at time of renewal", :new_or_used_vehicle=>"New", :sale_price=>"0", :base_msrp=>"0", :transaction_type=>"Original Registration", :transaction_date=>"2023-06-28T00:00:00.000", :transaction_year=>"2023", :county=>"King", :city=>"BELLEVUE", :state_of_residence=>"WA", :zip=>"98004", :meets_2019_hb_2042_sale_price_value_requirement=>false, :_2019_hb_2042_sale_price_value_requirement=>   "This transaction type is not eligible for the tax exemption", :electric_vehicle_fee_paid=>"No", :transportation_electrification_fee_paid=>"No", :hybrid_vehicle_electrification_fee_paid=>"No", :census_tract_2020=>"53033024001", :legislative_district=>"48", :electric_utility=>"PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)"}]
      vehicles = vehicle_factory.create_vehicles(vehicle)
      
      expect(vehicles[0].vin).to eq("7SAYGDEE0P")
      expect(vehicles[0].year).to eq("2023")
      expect(vehicles[0].make).to eq("TESLA")
      expect(vehicles[0].model).to eq("Model Y")
      expect(vehicles[0].engine).to eq(:ev)
      expect(vehicles[0].registration_date).to be(nil)
      expect(vehicles[0].plate_type).to eq(nil)

      expect(vehicle_factory.create_vehicles(wa_ev_registrations)).to all(be_a(Vehicle))
    end
  end
end