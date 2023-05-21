require './lib/new_facilities'  

RSpec.describe FacilityBuilder do
  it 'exists' do
    facility = FacilityBuilder.new

    expect(facility).to be_a(FacilityBuilder)
  end

  xit 'loads oregon locations' do
    facility = FacilityBuilder.new()
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    facility.load_locations(or_dmv_office_locations)

    expect(facility.locations.length).to eq(59)
    expect(facility.locations[0][:name]).to eq("Albany DMV Office")
    expect(facility.locations[1][:address]).to eq("600 Tolman Creek Rd Ashland OR 97520")
    expect(facility.locations[2][:phone]).to eq("503-325-3951")
  end
end