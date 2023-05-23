require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end
  describe '#create vehicles from data in link' do
    it 'can create vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      hot_rods = factory.create_vehicles(wa_ev_registrations)
      expect(hot_rods).to be_an_instance_of(Array)
      expect(hot_rods[0]).to be_an_instance_of(Vehicle)
      expect(hot_rods[1].engine).to eq([:ev])
      expect(hot_rods[1].year).to eq("2022")
      expect(hot_rods[1].vin).to eq([:vin])
    end
  end 
end