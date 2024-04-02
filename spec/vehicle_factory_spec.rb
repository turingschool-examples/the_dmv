require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
    end

    describe '#initialize' do
        it 'can initialize' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#create_vehicles' do
        it "can create an array of vehicles objects" do
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            registration = [{:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
                            :vin_1_10=>"7SAYGDEE0P",
                            :dol_vehicle_id=>"245533788",
                            :model_year=>"2023",
                            :make=>"TESLA",
                            :model=>"Model Y",
                            :vehicle_primary_use=>"Passenger",
                            :electric_range=>"0",
                            :odometer_reading=>"15",
                            :odometer_code=>"Actual Mileage",
                            :new_or_used_vehicle=>"New",
                            :sale_price=>"51630",
                            :date_of_vehicle_sale=>"2023-06-06T00:00:00.000",
                            :base_msrp=>"0",
                            :transaction_type=>"Original Title",
                            :transaction_date=>"2023-06-28T00:00:00.000",
                            :transaction_year=>"2023",
                            :county=>"King",
                            :city=>"BELLEVUE",
                            :state_of_residence=>"WA",
                            :zip=>"98004",
                            :meets_2019_hb_2042_sale_price_value_requirement=>false,
                            :_2019_hb_2042_sale_price_value_requirement=>"The sale price is too high",
                            :electric_vehicle_fee_paid=>"Not Applicable",
                            :transportation_electrification_fee_paid=>"Not Applicable",
                            :hybrid_vehicle_electrification_fee_paid=>"Not Applicable",
                            :census_tract_2020=>"53033024001",
                            :legislative_district=>"48",
                            :electric_utility=>"PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)"}]
            cars = @factory.create_vehicles(registration)

            expect(cars[0]).to be_an_instance_of(Vehicle)
            expect(cars[0].vin).to eq("7SAYGDEE0P")
            expect(cars[0].year).to eq("2023")
            expect(cars[0].make).to eq("TESLA")
            expect(cars[0].model).to eq("Model Y")
            expect(cars[0].engine).to eq(:ev)
            expect(cars[0].registration_date).to eq(nil)
            expect(cars[0].plate_type).to eq(nil)
        end
    end
end
