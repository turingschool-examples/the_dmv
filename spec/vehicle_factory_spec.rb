require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    
    @factory = VehicleFactory.new
    @dds = DmvDataService.new
  end

    describe '#create vehicles' do
    it 'create a vehicle' do
        vehicle_1 = @factory.create_vehicles(@dds.wa_ev_registrations).first
        
        expect(vehicle_1).to be_an_instance_of(Vehicle)
        expect(vehicle_1.vin).to eq('7SAYGDEE0P')
        expect(vehicle_1.year).to eq('2023')
        expect(vehicle_1.make).to eq('TESLA')
        expect(vehicle_1.model).to eq('Model Y')
        expect(vehicle_1.engine).to eq('Battery Electric Vehicle (BEV)')
    end
   end

   it 'creates all vehicles in registration data' do
        registration_data = @dds.wa_ev_registrations
        vehicles = @factory.create_vehicles(registration_data)

        expect(registration_data.size).to eq(vehicles.size)
   end
end