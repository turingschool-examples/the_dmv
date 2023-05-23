require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/vehicle_detail_handler'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'exist' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end
  describe '#create_vehicles' do
    it 'takes in car registrations and makes them Vehicle objects' do
      factory = VehicleFactory.new
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle_array = factory.create_vehicles(@wa_ev_registrations)
      expect(vehicle_array.first).to be_an_instance_of(Vehicle)
      expect(vehicle_array).to be_a(Array)
      expect(vehicle_array.first.make).to eq("TESLA")
      expect(vehicle_array.first.vin).to eq("7SAYGDEF6N")
    end
  end
end