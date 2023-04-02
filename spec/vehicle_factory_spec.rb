require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  it "takes api data and converts it into vehicle objects" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(factory.create_vehicles(wa_ev_registrations)).to be_a Array
  end
end