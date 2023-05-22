require './lib/new_facilities'  

RSpec.describe FacilityBuilder do
  it 'exists' do
    facility = FacilityBuilder.new

    expect(facility).to be_a(FacilityBuilder)
  end

  it 'recognizes data types from JSON' do 
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

    expect(or_dmv_office_locations).to be_a(Array)
    expect(or_dmv_office_locations.first).to be_a(Hash)
    expect(or_dmv_office_locations.length).to eq(59)

    facility = FacilityBuilder.new

    or_facilities = facility.create_facilities(or_dmv_office_locations)

    expect(or_facilities).to be_a(Array)
    expect(or_facilities.first).to be_a(Facility)
  end
end