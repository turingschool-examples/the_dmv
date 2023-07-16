require 'spec_helper'

RSpec.describe VehicleFactory do 
  before(:each) do 
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do 
    it 'can initialize' do 
      expect(@factory).to be_a(VehicleFactory)
    end
  end
  
  describe '#create_vehicles' do 
    it 'can create vehicle objects' do 
      @factory.create_vehicles(@wa_ev_registrations)
    end
  end
end