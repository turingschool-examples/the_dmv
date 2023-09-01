require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do

  describe '#initialize' do
    it 'creates an instance of VehicleFactory' do
      factory = VehicleFactory.new
    
      expect(factory).to be_an_instance_of VehicleFactory
    end
  end

  describe '#create_vehicles' do
    it 'creates vehicles from wa_ev_registrations' do
      #require "pry"; binding.pry
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)
      #require "pry"; binding.pry
      expect(factory.vehicles.count).to be(1000)
      # factory.create_vehicles(wa_ev_registrations).each do |registration|
      #   expect(registration).to be_instance_of(Vehicle)
      # end

    end
  end

end