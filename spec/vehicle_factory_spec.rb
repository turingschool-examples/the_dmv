require 'pry'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @or_dmv = DmvDataService.new.or_dmv_office_locations
        @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
    end

    it 'creates new vehicles' do
        new_vehicles = @factory.create_vehicles(@wa_ev_registrations)
        expect(new_vehicles).to be_an_instance_of(Vehicle)
    end

    it 'creates facility objects' do
        oregon_facilities = @factory.create_facility(@or_dmv)
        expect(oregon_facilities).to be_an_instance_of(Facility)
        ny_facilities = @factory.create_facility(@new_york_facilities)
        expect(ny_facilities).to be_an_instance_of(Facility)
        missouri_facilities = @factory.create_facility(@missouri_facilities)
        expect(missouri_facilities).to be_an_instance_of(Facility)
    end
end