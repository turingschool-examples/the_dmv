require 'rspec'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'


RSpec.describe do

  it 'exists' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(factory).to be_an_instance_of(VehicleFactory)
    
  end
  
  it 'creates vehicles' do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory = VehicleFactory.new
    cars = factory.create_vehicles(wa_ev_registrations)

# require 'pry'; binding.pry
    expect(cars.length).to eq(1000)
    expect(factory.create_vehicles(wa_ev_registrations)).to eq(new_cars)
  end
end
