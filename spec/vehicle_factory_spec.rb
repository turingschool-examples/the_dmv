require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do 
  it 'exists' do
    factory = VehicleFactory.new

    expect(factory).to be_a VehicleFactory
  end

  describe '#create_vehicles' do 
    it 'can return a list of the vehicles added to vehicle factory as an array' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      vehicles_in_array = factory.create_vehicles(wa_ev_registrations)

      expect(factory.vehicles).to be_an Array
    end
  end
end