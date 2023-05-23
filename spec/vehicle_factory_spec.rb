require 'spec_helper'


RSpec.describe VehicleFactory do
    describe '#create_vehicles' do
        it 'makes vehicles' do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        vehicles = factory.create_vehicles(wa_ev_registrations)

        expect(vehicles[0].make).to eq("TESLA")
        expect(vehicles[0].model).to eq("Model Y")
        expect(vehicles[0].year).to eq("2022")
        expect(vehicles[0].vin).to eq("7SAYGDEF6N")

        expect(vehicles[1].make).to eq("KIA")
        expect(vehicles[1].model).to eq("Niro")
        expect(vehicles[1].year).to eq("2022")
        expect(vehicles[1].vin).to eq("KNDCC3LG2N")
        end
    end
end