require 'spec_helper'

RSpec.describe FacilityFactory do
  it "creates a facility from a list of one facility" do
    facility_factory = FacilityFactory.new
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'})
    created_facility = facility_factory.create_facility([{name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'}])
    
    expect(created_facility[0].name).to eq(@facility.name)
    expect(created_facility[0].address).to eq(@facility.address)
    expect(created_facility[0].phone).to eq(@facility.phone)
  end

  it "creates a facility from a list of facilities" do
    facility_factory = FacilityFactory.new
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'})
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092'})
    created_facilities = facility_factory.create_facility([{name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'}, {name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092'}])
    
    expect(created_facilities[0].name).to eq(facility_1.name)
    expect(created_facilities[0].address).to eq(facility_1.address)
    expect(created_facilities[0].phone).to eq(facility_1.phone)
    expect(created_facilities[1].name).to eq(facility_2.name)
    expect(created_facilities[1].address).to eq(facility_2.address)
    expect(created_facilities[1].phone).to eq(facility_2.phone)
  end



end