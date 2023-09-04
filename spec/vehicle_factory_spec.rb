require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'creates Vehicle objects with given attributes' do
      # wa_ev_registrations = [ { :vin_1_10 => 'JTDKN3DP8D', :make => 'TOYOTA', 
      #   :model => 'Prius Plug-in', :model_year => '2013', :engine => 'ev' }, 
      #   { :vin_1_10 => '1G1RD6E47D', :make => 'CHEVROLET', :model => 'Volt', 
      #   :model_year => '2013', :engine => 'ev' } ]
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        vehicles = @factory.create_vehicles(wa_ev_registrations)
        vehicles.each do |car|
          require 'pry'; binding.pry
          expect(car).to be_a(Vehicle)
          expect(car.vin).to_not eq(nil)
          
        end
      
      
    end
  end
end