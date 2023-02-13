require 'spec_helper'

RSpec.describe do VehicleFactory 
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
  describe '#data to vehicle class' do
    it 'create_vehicle passed data to vehicle class' do
      @vehicle_1 = Vehicle.new({vin: "JTDKN3DP8D", year: "2013", make: "TOYOTA", model: "Prius Plug-in", engine: :ev})
      @vehicle_2 = Vehicle.new({vin: "JTDKARFP9J", year: "2018", make: "TOYOTA", model: "Prius Prime", engine: :ev})
      @created_vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(@created_vehicles[0].vin).to eq(@vehicle_1.vin)
      expect(@created_vehicles[1].vin).to eq(@vehicle_2.vin)
      expect(@created_vehicles[0].year).to eq(@vehicle_1.year)
      expect(@created_vehicles[1].year).to eq(@vehicle_2.year)
      expect(@created_vehicles[0].make).to eq(@vehicle_1.make)
      expect(@created_vehicles[1].make).to eq(@vehicle_2.make)
      expect(@created_vehicles[0].model).to eq(@vehicle_1.model)
      expect(@created_vehicles[1].model).to eq(@vehicle_2.model)
      expect(@created_vehicles[0].engine).to eq(@vehicle_1.engine)
      expect(@created_vehicles[1].engine).to eq(@vehicle_2.engine)
    end
  end
end