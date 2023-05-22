require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    describe '#initialize' do
      it 'can initialize' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
      end
    end
    describe '#create vehicles from data in link' do
      it 'can create vehicles' do
        @factory.create_vehicles(wa_ev_registrations)
      end
    end 
  end
end