require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  before(:each) do
    @vfactory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  it 'exists' do
    expect(@vfactory).to be_an_instance_of VehicleFactory
  end

  it 'can produce vehicles' do
    @vfactory.create_vehicles(@wa_ev_registrations)
    
    @vfactory.off_the_lot.each do |vehicle|
      expect(vehicle).to be_an_instance_of Vehicle
    end
  end
end