require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end
  describe '#initialize' do
    it 'exists' do
    
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles'
    it 'can create vehicles'
    wa_ev_registrations = DnvDataService.new.wa_ev_registrations
end