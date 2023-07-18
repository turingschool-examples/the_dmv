require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        # @Dmv_data = [{"electric_vehicle_type":"Plug-in Hybrid Electric Vehicle (PHEV)","vin_1_10":"1G1RC6S55J","dol_vehicle_id":"186181103","model_year":"2018","make":"CHEVROLET","model":"Volt","vehicle_primary_use":"Passenger","electric_range":"53","odometer_reading":"17655","odometer_code":"Actual Mileage","new_or_used_vehicle":"Used","sale_price":"23990","date_of_vehicle_sale":"2021-11-18T00:00:00.000","base_msrp":"0","transaction_type":"Original Title","transaction_date":"2021-12-08T00:00:00.000","transaction_year":"2021","county":"Clark","city":"VANCOUVER","state_of_residence":"WA","zip":"98685","non_clean_alternative_fuel":"HB 2778 Eligiblity Requirements not met","hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility":"Clean Alternative Fuel Vehicle","meets_2019_hb_2042_electric_range_requirement":true,"meets_2019_hb_2042_sale_date_requirement":true,"meets_2019_hb_2042_sale_price_value_requirement":true,"_2019_hb_2042_battery_range_requirement":"Meets battery range requirement","_2019_hb_2042_purchase_date_requirement":"Meets purchase date requirement","_2019_hb_2042_sale_price_value_requirement":"Meets title transaction requirement","electric_vehicle_fee_paid":"Not Applicable","transportation_electrification_fee_paid":"Not Applicable","hybrid_vehicle_electrification_fee_paid":"Not Applicable","census_tract_2020":"53011040904","legislative_district":"49","electric_utility":"BONNEVILLE POWER ADMINISTRATION||PUD NO 1 OF CLARK COUNTY - (WA)"}
    end
    describe '#initialize' do
        it 'can initialize' do

            expect(@factory).to be_an_instance_of(VehicleFactory)
            expect(@wa_ev_registrations).to be_an_instance_of(Array)
            
        end
    end
    describe '#create vehicles' do
        it "can add vehicles from state's DMV office"do
        vehicles = @factory.create_vehicles(@wa_ev_registrations)
        
            expect(vehicles[0]).to be_a(Vehicle)
            expect(vehicles).to be_an_instance_of(Array)
            expect(vehicles[0].vin).to_not eq(nil)
            expect(vehicles[0].vin).to be_an_instance_of(String)
            expect(vehicles[0].year).to_not eq(nil)
            expect(vehicles[0].year).to be_a(Integer)
            expect(vehicles[0].make).to_not eq(nil)
            expect(vehicles[0].make).to be_a(String)
            expect(vehicles[0].model).to_not eq(nil)
            expect(vehicles[0].model).to be_a(String)
            expect(vehicles[0].engine).to eq(:ev)
            expect(vehicles.length).to eq(@wa_ev_registrations.length)
        end
        # Vehicles is an array of vehicle objects
        # Each element is one vehicle object
        # Each vehicle object contains: vin, year, make, model, engine
    end
end