require 'spec_helper'


RSpec.describe FacilityOffice do
  before(:each) do
    @office = FacilityOffice.new(@co_dmv_office_locations)
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end

  describe '#create_offices' do
    it 'creates Facility objects with given attributes' do
  
     @office_list = @office.create_offices(@co_dmv_office_locations)
      
      expect(@office_list.length).to eq(@co_dmv_office_locations.length)
      expect(@office_list.first).to be_a(FacilityOffice)
    end
  end
end

# vin: data[:vin_1_10], make: data[:make], model: data[:model], year: data[:model_year], engine: 'ev'