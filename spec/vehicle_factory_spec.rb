require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
    before(:each) do
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @factory = VehicleFactory.new
    end
    
    describe '#it exists' do
        it 'it exists' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#create vehicles' do
        it 'creates vehicles using the WA EV registrations' do
            vehicles = @factory.create_vehicles(@wa_ev_registrations)
            expect(vehicles[0]).to be_an_instance_of(Vehicle)
        end
    end
end