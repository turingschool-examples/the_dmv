require 'spec_helper'

RSpec.describe Dataset do
  before(:each) do 
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe 'initializing a dataset' do 
    it 'exists' do

      
    end

  end
end