require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
    describe '#initialize' do
        it "can initialize" do
            factory = VehicleFactory.new
            expect(factory).to be_a VehicleFactory
        end
    end

    describe '#create_vehicles' do
        it 'can create new vehicles within the factory' do
            factory = VehicleFactory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            factory.create_vehicles(wa_ev_registrations)
        end
    end
end