require 'spec_helper'


RSpec.describe VehicleFactory do
    before do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    it 'exists' do
        expect(@factory).to be_a(VehicleFactory)
    end

    describe '#format' do
        it 'formats data to pass to Vehicle class' do
            vehicle = {"electric_vehicle_type":"Battery Electric Vehicle (BEV)","vin_1_10":"7SAYGDEF6N","dol_vehicle_id":"197458138","model_year":"2022","make":"TESLA","model":"Model Y","vehicle_primary_use":"Passenger","electric_range":"0","odometer_reading":"0","odometer_code":"Odometer reading is not collected at time of renewal","new_or_used_vehicle":"New","sale_price":"0","base_msrp":"0","transaction_type":"Original Registration","transaction_date":"2022-05-04T00:00:00.000","transaction_year":"2022","county":"Thurston","city":"OLYMPIA","state_of_residence":"WA","zip":"98502","non_clean_alternative_fuel":"HB 2778 Eligiblity Requirements not met","hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility":"HB 2042 Eligibility Requirements not met","meets_2019_hb_2042_electric_range_requirement":false,"meets_2019_hb_2042_sale_date_requirement":false,"meets_2019_hb_2042_sale_price_value_requirement":false,"_2019_hb_2042_battery_range_requirement":"No battery range","_2019_hb_2042_purchase_date_requirement":"Non-sale, registration transaction","_2019_hb_2042_sale_price_value_requirement":"Non-sale, registration transaction","electric_vehicle_fee_paid":"No","transportation_electrification_fee_paid":"No","hybrid_vehicle_electrification_fee_paid":"No","census_tract_2020":"53067010520","legislative_district":"22","electric_utility":"PUGET SOUND ENERGY INC"}
            vehicle_formatted = {vin: "7SAYGDEF6N", year: 2022, make: "TESLA", model: "Model Y", engine: :ev}
            expect(@factory.format(vehicle)).to eq([vehicle_formatted])
        end
    end
        
    describe '#create vehicle' do
        it 'generates new vehicle instances' do
            expect(@wa_ev_registrations).to be_a(Array)
            expect(@wa_ev_registrations.first).to be_a(Hash)
            vehicles = @factory.create_vehicles(@wa_ev_registrations)
            expect(vehicles).to be_a(Array)
            expect(vehicles.first).to be_a(Vehicle)
            expect(vehicles.length).to eq(1000)
            expect(vehicles.sample).to be_a(Vehicle)
            expect(vehicles.first.make).to eq("TESLA")
            expect(vehicles.first.engine).to eq(:ev)
            expect(vehicles.first.model).to eq("Model Y")
            expect(vehicles.first.vin).to eq("7SAYGDEF6N")
            expect(vehicles.first.year).to eq(2022)
            expect(vehicles.first.registration_date).to be_nil
            expect(vehicles.first.plate_type).to be_nil
            expect(vehicles.sample.engine).to eq(:ev)
            expect(vehicles.sample.vin).to_not be_nil
        end
    end
end