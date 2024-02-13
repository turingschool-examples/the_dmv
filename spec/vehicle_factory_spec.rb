require 'spec_helper'

RSpec.describe VehicleFactory do 
  before(:each) do 
    @factory = VehicleFactory.new 
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
   
  end

  describe'#Vehicle factory' do 
    it 'Creates a new vehicle from ' do 
      expect(@factory).to be_a(VehicleFactory)
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to be_a(Array)
      require 'pry'; binding.pry


    end
  end


end