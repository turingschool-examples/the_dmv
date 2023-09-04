require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require'./lib/dmv_data_service'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe '#create_vehicles' do
    it 'creates Vehicle objects from API data' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      @factory.create_vehicles(wa_ev_registrations)
      
    end
  end

end
