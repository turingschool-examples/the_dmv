require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'


RSpec.describe VehicleFactory do
  before(:each) do
      @factory = VehicleFactory.new
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end
 
    describe 'initialize' do
      it 'exists' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
  
  describe 'adding vehicles from DB' do
    it 'creates vehicles' do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an(Array)
    end
  end

end