require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wav_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'can create vehicles' do
      vehicles = @factory.create_vehicles(@wav_ev_registrations)
      expect(vehicles).to be_an_instance_of(Array)
      expect(vehicles.all? { |vehicle| vehicle.is_a?(Vehicle) }).to be(true)
      expect(vehicles.all? { |vehicle| vehicle.vin.is_a?(String) }).to be(true)
      expect(vehicles.all? { |vehicle| vehicle.year.is_a?(String) }).to be(true)
      expect(vehicles.all? { |vehicle| vehicle.make.is_a?(String) }).to be(true)
      expect(vehicles.all? { |vehicle| vehicle.model.is_a?(String) }).to be(true)
      expect(vehicles.all? { |vehicle| vehicle.engine.is_a?(Symbol) }).to be(true)
    end
  end
end