require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    # require 'pry'; binding.pry
  end

  describe '#creates_a_vehicle ' do
    it 'will create vehicle objects with registration' do
      expect(@factory).to be_a(VehicleFactory)
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to be_a(Array)
      # require 'pry'; binding.pry
      expect(vehicles[0]).to be_a(Vehicle)
      expect(vehicles[0].make).to_not be_nil
      expect(vehicles[0].model).to be_a(String)
      expect(vehicles[0].vin).to be_a(String)
    end
  end
end