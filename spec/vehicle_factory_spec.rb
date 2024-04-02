require 'spec_helper'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe VehicleFactory do

    it 'exists' do
        facility_factory = VehicleFactory.new

        expect(facility_factory).to be_an_instance_of(VehicleFactory)
    end

    it 'can take a vehicle from an API and format it for our needs' do
        facility_factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations

        expect(facility_factory.create_vehicle(wa_ev_registrations)).to be_an_instance_of(Array)
    end
end
