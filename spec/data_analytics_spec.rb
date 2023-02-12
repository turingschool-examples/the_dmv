require 'spec_helper'

RSpec.describe 'Analyize Data' do
  describe 'EV Registration' do
    xit 'finds the most popular make and model' do
      # CODE HERE
    end

    xit 'counts number of registered vehicles by model year' do
      # CODE HERE
    end

    xit 'finds county that has most registered vehicles' do
      # CODE HERE
    end
  end

  describe 'Facilities' do 
    xit 'finds daily hours for each facility' do
      # CODE HERE
    end

    xit 'which holidays are closed for each specific state' do
      # CODE HERE
    end
  end

  describe 'Vehicles' do
    it 'creates vehicle objects from NY State Registration data' do
      factory = VehicleFactory.new
      ny_state_registrations = DmvDataService.new.ny_state_registrations
      created_vehicles = factory.create_vehicles(ny_state_registrations)
      
      expect(created_vehicles).to be_a(Array)
      expect(created_vehicles.first).to be_a(Vehicle)
      expect(created_vehicles.length).to be(250)
    end
   
  end
end