require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do

  it "exists" do
    factory = VehicleFactory.new
    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  it 'has wa_ev_registrations' do
    factory = VehicleFactory.new
    expect(@wa_ev_registrations)
  end

  it "can create vehicles" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    # require 'pry'; binding.pry
    vehicle = factory.create_vehicles(wa_ev_registrations)
    # require 'pry'; binding.pry
    # expect(factory.create_vehicles(wa_ev_registrations)).to eq(vehicle)
    expect(vehicle[2].make).to eq("VOLKSWAGEN")
  end
end