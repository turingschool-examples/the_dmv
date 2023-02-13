require 'spec_helper'

RSpec.describe Dataset do
  before(:each) do
    @vehicle_factory = VehicleFactory.new
    @facility_factory = FacilityFactory.new

    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @oregon_facilities_data = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities_data = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities_data = DmvDataService.new.mo_dmv_office_locations

    @wa_ev_vehicles = @vehicle_factory.create_vehicles(@wa_ev_registrations)
    @oregon_facilities = @facility_factory.create_facilities(@oregon_facilities_data, :OR)
    @new_york_facilities = @facility_factory.create_facilities(@new_york_facilities_data, :NY)
    @missouri_facilities = @facility_factory.create_facilities(@missouri_facilities_data, :MO)

    @wa_ev_dataset = Dataset.new(@wa_ev_vehicles)
    @oregon_dataset = Dataset.new(@oregon_facilities)
    @new_york_dataset = Dataset.new(@new_york_facilities)
    @missouri_dataset = Dataset.new(@missouri_dataset)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@wa_ev_dataset).to be_a Dataset
      expect(@oregon_dataset).to be_a Dataset
      expect(@new_york_dataset).to be_a Dataset
      expect(@missouri_dataset).to be_a Dataset
    end
  end

end
