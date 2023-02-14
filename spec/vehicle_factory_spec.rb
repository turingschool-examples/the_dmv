require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe '#initialize' do 
    it 'exists' do
      factory = VehicleFactory.new
      expect(factory).to be_a(VehicleFactory)
    end

    it 'begins with an empty array' do
      factory = VehicleFactory.new
      expect(factory.vehicle_registrations).to eq([])
    end

  end
    
  describe '#factory is operative' do
    xit 'creates vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      
      factory.create_vehicles(wa_ev_registrations).to 
    end
  end
end