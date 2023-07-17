require 'spec_helper'

RSpec.describe VehicleFactory do 
  before(:each) do 
    @vehicle_factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do 
    it 'can initialize' do 
      expect(@vehicle_factory).to be_a(VehicleFactory)
    end
  end
  
  describe '#create vehicles' do 
    xit 'can create vehicle objects' do 
      new_vehicles = @vehicle_factory.create_vehicles(@wa_ev_registrations)
      expect(new_vehicles).to be_a(Vehicle)
    end
  end
end