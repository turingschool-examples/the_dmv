require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @vehicle_factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end
    
    describe '#initialize' do
        it 'can initialize' do
        expect(@vehicle_factory).to be_an_instance_of(VehicleFactory)
        end
    end
    
    describe '#create_vehicles' do
        it 'can return array of vehicle objects' do

        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
        
        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations).first).to be_an_instance_of(Vehicle)

        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations)[0].vin).to eq(@wa_ev_registrations[0][:vin_1_10])
        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations)[0].year).to eq(@wa_ev_registrations[0][:model_year])
        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations)[0].engine).to eq(@wa_ev_registrations[0][:engine])
        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations)[0].make).to eq(@wa_ev_registrations[0][:make])
        expect(@vehicle_factory.create_vehicles(@wa_ev_registrations)[0].model).to eq(@wa_ev_registrations[0][:model])
        end
    end
    
    describe '#most_popular_makemodel' do
        it 'can return most popular make/model' do
        vehicles = @vehicle_factory.create_vehicles(@wa_ev_registrations)
        
        expect(@vehicle_factory.most_popular_makemodel(vehicles)).to eq("NISSAN Leaf")
        end
    end

    describe '#counter_by_model_year' do
        it 'can return count of vehicles by model year' do
        vehicles = @vehicle_factory.create_vehicles(@wa_ev_registrations)
        
        expect(@vehicle_factory.counter_by_model_year(vehicles)).to eq({"2011" => 14, "2012" => 26, "2013" => 77, "2014" => 96, "2015" => 57, "2016" => 93, "2017" => 84, "2018" => 81, "2019" => 79, "2020" => 58, "2021" => 87, "2022" => 108, "2023" => 131, "2024" => 9})
        end
    end

    describe '#county_with_most_registered_vehicles' do
        it 'can return county with most registered vehicles' do
        vehicles = @vehicle_factory.create_vehicles(@wa_ev_registrations)
        
        expect(@vehicle_factory.county_with_most_registered_vehicles(vehicles)).to eq('King')
        end
    end

end