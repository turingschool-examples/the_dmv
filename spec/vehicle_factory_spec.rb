require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end
    
    describe '#it exists' do
        it 'it exists' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end
end