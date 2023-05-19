require 'spec_helper'

# dmv = DmvDataService.new.wa_ev_registrations
#returns an array of 1000 hashes. Each hash is one car, and with 24 key-value pairs
# teslas = dmv.find_all {|car| car[:make] == "TESLA" }
# teslas.length = 408
# used_teslas = teslas.find_all {|car| car[:new_or_used_vehicle] == "Used"}
# used_teslas.length = 211
# used_cars = dmv.find_all {|car| car[:new_or_used_vehicle] == "Used"}
# used_cars.length = 621


RSpec.describe VehicleFactory do
    it 'exists' do
        factory = VehicleFactory.new
        expect(factory).to be_a(VehicleFactory)
    end
        
    describe '#create vehicle' do
        it 'generates new vehicle instances' do
            factory = VehicleFactory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            expect(wa_ev_registrations).to be_a(Array)
            expect(wa_ev_registrations.first).to be_a(Hash)
            vehicles = factory.create_vehicles(wa_ev_registrations)
            expect(vehicles).to be_a(Array)
            expect(vehicles.first).to be_a(Vehicle)
            expect(vehicles.length).to eq(1000)
            expect(vehicles.sample).to be_a(Vehicle)
        end
    end
end
#it "accounts for different facility hash styles"?
#test for each state?
# consider that hashes look different in each facility... test for alternate facilities?