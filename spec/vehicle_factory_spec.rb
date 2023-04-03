require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  it 'Exists' do
    factory = VehicleFactory.new
    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  it 'Can register Vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    factory.create_vehicles(wa_ev_registrations)
  end
end





