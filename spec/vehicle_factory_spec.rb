require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
    describe '#create_vehicles' do
      it 'creates vehicles from WA EV registrations data' do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  
        vehicles = factory.create_vehicles(wa_ev_registrations)
  
        expect(vehicles).to all(be_an_instance_of(Vehicle))
      end
    end
  end