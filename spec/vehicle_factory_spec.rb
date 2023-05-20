require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do 
  before(:each) do 
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do 
    it 'can initialize' do 
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'can create vehicles using external data' do 
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a(Array)
      expect(@factory.create_vehicles(@wa_ev_registrations).first).to be_a(Vehicle)
    end
  end
end