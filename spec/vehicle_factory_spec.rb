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
    before(:each) do
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(@wa_ev_registrations)
    end

    it 'Create only vehicle instances using WA DMV data' do
      expect(@factory.instance_variable_get(:@factory_vehicles).length).to eq(1000)
      expect(@factory.instance_variable_get(:@factory_vehicles)).to all be_a Vehicle
    end

  end
end