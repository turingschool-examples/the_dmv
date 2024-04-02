require 'spec_helper'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Facility do

    it 'exists' do
        factory = VehicleFactory.new

        expect(factory).to be_an_instance_of(VehicleFactory)
    end

    it 'can take a vehicle from an API and format it for our needs' do
        factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations

        expect(factory.create_vehicle(wa_ev_registrations)).to be_an_instance_of(Array)
    binding.pry
    end
end
