require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe '#initialize' do 
    it 'exists' do
      factory = VehicleFactory.new
      expect(factory).to be_a(VehicleFactory)
    end

    # it 'begins with an empty array' do
    #   factory = VehicleFactory.new
    #   expect(factory.vehicle_registrations).to eq([])
    # end

  end
    
  describe '#factory is operative' do
    it 'creates vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      
      expect(factory.create_vehicles(wa_ev_registrations)).to be_an_instance_of(Array)
    end

    it 'vehicles have vin numbers' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle = factory.create_vehicles(wa_ev_registrations)
      expect(vehicle.vin).to eq([:vin_1_10])
    end
  end
end