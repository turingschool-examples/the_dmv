require './lib/dmv'
require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do 
  it 'exists' do
    facility = FacilityFactory.new

    expect(facility).to be_a FacilityFactory
  end

  describe '#create_facility' do 
    it 'exists' do 
      facility = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      array_of_facilities = facility.create_facilities(co_dmv_office_locations)

      facility_1 = array_of_facilities.sample
  
      expect(array_of_facilities).to all be_a(Facility)
      expect(facility_1.name).to be_a(String)
      expect(facility_1.address).to be_a(String)
      expect(facility_1.phone).to be_a(String)
      expect(array_of_facilities.length).to eq(co_dmv_office_locations.length)

      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      array_of_ny_facilities = facility.create_facilities(new_york_facilities)

      facility_2 = array_of_ny_facilities.sample

      expect(array_of_ny_facilities).to all be_a(Facility)
      expect(facility_2.name).to be_a(String)
      expect(facility_2.address).to be_a(String)
      expect(facility_2.phone).to be_a(String)
      expect(array_of_ny_facilities.length).to eq(new_york_facilities.length)

      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      array_of_mo_facilities = facility.create_facilities(missouri_facilities)

      facility_3 = array_of_mo_facilities.sample

      expect(array_of_mo_facilities).to all be_a(Facility)
      expect(facility_3.name).to be_a(String)
      expect(facility_3.address).to be_a(String)
      expect(facility_3.phone).to be_a(String)
      expect(array_of_mo_facilities.length).to eq(missouri_facilities.length)

    end
  end
end