require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end
  describe '#initialize' do
        it 'can initialize' do
            expect(@factory).to be_an_instance_of(FacilityFactory)
        end
    end

    describe '#create_facilities' do
        it 'allows creating facilities' do
            require 'pry'; binding.pry
        end
    end
end