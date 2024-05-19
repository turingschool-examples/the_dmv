require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = [{:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
                            :vin_1_10=>"JTMCB3FV2P",
                            :dol_vehicle_id=>"253391190",
                            :model_year=>"2023",
                            :make=>"TOYOTA",
                            :model=>"RAV4 Prime",
                            :vehicle_primary_use=>"Passenger",
                            :electric_range=>"42",
                            :odometer_reading=>"5",
                            :odometer_code=>"Actual Mileage",
                            :new_or_used_vehicle=>"New",
                            :sale_price=>"47818",
                            :date_of_vehicle_sale=>"2023-08-23T00:00:00.000",
                            :base_msrp=>"0",
                            :transaction_type=>"Original Title",
                            :transaction_date=>"2023-09-14T00:00:00.000",
                            :transaction_year=>"2023",
                            :county=>"King",
                            :city=>"KIRKLAND",
                            :state_of_residence=>"WA",
                            :zip=>"98034",
                            :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
                            :meets_2019_hb_2042_electric_range_requirement=>true,
                            :meets_2019_hb_2042_sale_date_requirement=>true,
                            :meets_2019_hb_2042_sale_price_value_requirement=>false,
                            :_2019_hb_2042_battery_range_requirement=>"Battery range requirement is met",
                            :_2019_hb_2042_purchase_date_requirement=>"Purchase date requirement is met",
                            :_2019_hb_2042_sale_price_value_requirement=>"The sale price is too high",
                            :electric_vehicle_fee_paid=>"Not Applicable",
                            :transportation_electrification_fee_paid=>"Not Applicable",
                            :hybrid_vehicle_electrification_fee_paid=>"Not Applicable",
                            :census_tract_2020=>"53033022003",
                            :legislative_district=>"45",
                            :electric_utility=>"PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)"},
                            {:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
                            :vin_1_10=>"7SAYGDEE1P",
                            :dol_vehicle_id=>"229813860",
                            :model_year=>"2023",
                            :make=>"TESLA",
                            :model=>"Model Y",
                            :vehicle_primary_use=>"Passenger",
                            :electric_range=>"0",
                            :odometer_reading=>"0",
                            :odometer_code=>"Odometer reading is not collected at time of renewal",
                            :new_or_used_vehicle=>"New",
                            :sale_price=>"0",
                            :base_msrp=>"0",
                            :transaction_date=>"2022-12-20T00:00:00.000",
                            :transaction_year=>"2022",
                            :county=>"King",
                            :city=>"SEATTLE",
                            :state_of_residence=>"WA",
                            :zip=>"98177",
                            :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
                            :meets_2019_hb_2042_electric_range_requirement=>true,
                            :meets_2019_hb_2042_sale_date_requirement=>false,
                            :meets_2019_hb_2042_sale_price_value_requirement=>false,
                            :_2019_hb_2042_battery_range_requirement=>"Battery range requirement is met",
                            :_2019_hb_2042_purchase_date_requirement=>"This transaction type is not eligible for the tax exemption",
                            :_2019_hb_2042_sale_price_value_requirement=>"This transaction type is not eligible for the tax exemption",
                            :electric_vehicle_fee_paid=>"No",
                            :transportation_electrification_fee_paid=>"No",
                            :hybrid_vehicle_electrification_fee_paid=>"No",
                            :census_tract_2020=>"53033001400",
                            :legislative_district=>"36",
                            :electric_utility=>"CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)"}]
  end


  describe "#initialize" do
    it "exists" do
      expect(@factory).to be_a VehicleFactory
    end
  end

  describe "#create_vehicles" do
    it "can create a vehicle" do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      vehicle = vehicles[0]

      expect(vehicle).to be_a Vehicle
      expect(vehicle.engine).to eq :ev
      expect(vehicle.vin).to eq("JTMCB3FV2P")
      expect(vehicle.make). to eq("TOYOTA")
    end

    it "can create more than one vehicle" do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)

      expect(vehicles.count).to be 2
      expect(vehicles[1].engine).to eq :ev
      expect(vehicles[1].make).to eq("TESLA")
    end
  end
  







end