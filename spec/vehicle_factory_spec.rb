require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

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
    end
    it 'can take in registration information from more than one source' do
      factory = VehicleFactory.new
      @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      vehicle_array = factory.create_vehicles(@or_dmv_office_locations)
      require 'pry'; binding.pry
      expect(vehicle_array.first).to be_an_instance_of(Vehicle)
      expect(vehicle_array).to be_a(Array)
    end
    it 'can handle data of multiple sources' do
      
    end

  end
end