require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize"
    it 'can initialize' do 
      factory = VehicleFactory.new

      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles(data)' do
    it 'creates an inventory of electronic vehicles registered in Washington' do 
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle = factory.create_vehicles(wa_ev_registrations)
    
      expect(vehicle[0].vin).to eq("WMEEJ9AA7E")
      expect(vehicle[0].year).to eq("2014")
      expect(vehicle[0].make).to eq("SMART")
      expect(vehicle[0].model).to eq("Fortwo Electric Drive")
      expect(vehicle[0].engine).to eq(:ev)
      expect(vehicle[0].registration_date).to eq('N/A')
    end

    it 'can return the attribute information about a registered vehicle' do 
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle = factory.create_vehicles(wa_ev_registrations)
      
      expect(vehicle[2].vin).to eq("WVWKR7AU7K")
      expect(vehicle[2].year).to eq("2019")
      expect(vehicle[2].make).to eq("VOLKSWAGEN")
      expect(vehicle[2].model).to eq("e-Golf")
      expect(vehicle[2].engine).to eq(:ev)
      expect(vehicle[2].registration_date).to eq('N/A')
    end

end
