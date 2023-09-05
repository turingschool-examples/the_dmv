require './lib/vehicle'
require './lib/dmv_data_service'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
      expect(@factory.factory_vehicles).to eq([])
    end
  end

  describe '#create_vehicles' do
    it 'Create only vehicle instances using WA DMV data' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)
      expect(@factory.instance_variable_get(:@factory_vehicles).length).to eq(1000)
      expect(@factory.instance_variable_get(:@factory_vehicles)).to all be_a Vehicle

      expect(@factory.factory_vehicles[0].vin).to eq('1N4AZ0CPXF')
      expect(@factory.factory_vehicles[0].year).to eq('2015')
      expect(@factory.factory_vehicles[0].make).to eq('NISSAN')
      expect(@factory.factory_vehicles[0].model).to eq('Leaf')
      expect(@factory.factory_vehicles[0].engine).to eq(:ev)
      expect(@factory.factory_vehicles[0].plate_type).to be_nil
      expect(@factory.factory_vehicles[0].registration_date).to be_nil
    end
  end
end