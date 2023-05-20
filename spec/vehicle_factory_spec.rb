require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        #
    end

    describe '#initialize' do
        it 'should create a new vehicle factory' do
            expect(factory = VehicleFactory.new).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#create_vehicles' do
        it 'should create vehicle objects from imported data' do
            factory = VehicleFactory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            #require 'pry'; binding.pry
            expect(factory.create_vehicles(wa_ev_registrations)).to be_an_instance_of(Array)
        end
    end
end