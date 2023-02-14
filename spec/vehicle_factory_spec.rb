require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe '#initialize' do 
    it 'exists' do
      factory = VehicleFactory.new
      expect(factory).to be_a(VehicleFactory)
    end

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
      factory.create_vehicles(wa_ev_registrations)
      # require 'pry'; binding.pry
      expect(factory.vehicles[0][:vin]).to eq(wa_ev_registrations[0][:vin_1_10])
    end

    xit 'vehicles have engines' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)
      require 'pry'; binding.pry
      expect(factory.vehicles[0][:engine]).to eq([:ev])
    end

    xit 'vehicles have years' do 
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)
      (factory.vehicles[@year]).to eq(wa_ev_registrations[0][:model_year])
    end
  end
end