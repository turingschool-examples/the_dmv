require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do 
  before(:each) do 
    @factory = VehicleFactory.new
  end

  describe '#initialize' do 
    it 'can initialize' do 
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'can create vehicles using external data' do 

      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            expect(wa_ev_registrations).to be_a(Array)
            expect(wa_ev_registrations.first).to be_a(Hash)

      vehicles = @factory.create_vehicles(wa_ev_registrations)
            expect(vehicles).to be_a(Array)
            expect(vehicles.first).to be_a(Vehicle)
      
      expect(@factory.new_vehicles.length).to eq(1000)
    end
  end
end