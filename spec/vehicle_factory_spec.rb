require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  it 'exists' do
    vfactory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(vfactory).to be_an_instance_of VehicleFactory
  end

  it 'can produce vehicles' do
    vfactory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    

    vfactory.create_vehicles(wa_ev_registrations)
    # require'pry';binding.pry
    expect(vfactory.off_the_lot[0]).to be_an_instance_of Vehicle

  end
end