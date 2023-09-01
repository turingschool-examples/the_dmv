require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  it 'exists' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory).to be_an_instance_of VehicleFactory
  end

  it 'can produce vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    

    factory.create_vehicles(wa_ev_registrations)
    require'pry';binding.pry
    # expect(factory.create_vehicles(wa_ev_registrations)).to eq(factory.off_the_lot)
  end
end