require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  before do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#dmv data' do
    it 'can recieve data from WA' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      result = @factory.create_vehicles(wa_ev_registrations)

      expect(result).to be_a(Array)
      expect(result[0]).to be_a(Vehicle)
      expect(result[0].year).to be_a("2018")
    end
  end
end