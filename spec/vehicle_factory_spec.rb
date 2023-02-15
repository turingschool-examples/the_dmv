require 'spec_helper'


RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = VehicleFactory.new

      expect(factory).to be_an_instance_of(VehicleFactory)
      expect(factory.rendered_data_array).to eq([])
      expect(factory.made_vehicles).to eq([])
    end
  end

  describe '#render data' do
    it 'can render data' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      factory.render_data(wa_ev_registrations)

      expect(factory.rendered_data_array).to be_a Array
      expect(factory.rendered_data_array.first).to be_a Hash
      
    end
  end

  describe '#create vehicles' do
    it 'creates vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      factory.create_vehicles(wa_ev_registrations)

      expect(factory.made_vehicles.first).to be_an_instance_of(Vehicle)
    end
  end

end