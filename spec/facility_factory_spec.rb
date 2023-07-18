require 'rspec'
require './lib/facility_factor'
require './lib/facility'
require './lib/dmv'

RSpec.describe VehicleFactory do
    before(:each) do
        @dmv = Dmv.new
        @facility = FacilityFactory.new
        co_facilities = DmvDataService.new.co_dmv_office_locations
    end

    describe '#initialize' do
      it 'can initialize' do
        expect(@@facility).to be_an_instance_of(FacilityFactory)
      end
    end

    describe '#create_facilities' do
      it 'can create facilities' do
        @facility.create_facilities(co_facilities)

        expect(@facility.facility_list).to all be_a Facility
        expect(@facility.facility_list).to all be_a Facility
      end
    end
end