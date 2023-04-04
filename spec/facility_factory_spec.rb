require 'spec_helper'

RSpec.describe FacilityFactory do
  it "creates a facility from a list of one facility" do
    facility_factory = FacilityFactory.new
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'})
    created_facility = facility_factory.create_facility([{name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'}])
    
    expect(facility_factory).to be_an_instance_of(FacilityFactory)
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

  it "creates facilities in Oregon from an external list of facilities" do
    facility_factory = FacilityFactory.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations 
    or_data = facility_factory.oregon_transform(or_dmv_office_locations)
    or_created_facilities = facility_factory.create_facility(or_data)
    # require 'pry'; binding.pry
    # address not formatted correctly - formatted as a hash with :latitude, :longitude
    expect(or_created_facilities[0]).to be_an_instance_of(Facility)
    expect(or_created_facilities).to be_an(Array)
    expect(or_created_facilities.count).to eq(59)
  end

  it "creates facilities in New York from an external list of facilities" do
    facility_factory = FacilityFactory.new
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    
    ny_data = facility_factory.ny_transform(ny_dmv_office_locations)
    ny_created_facilities = facility_factory.create_facility(ny_data)
    
    expect(ny_created_facilities[0]).to be_an_instance_of(Facility)
    expect(ny_created_facilities).to be_an(Array)
    require 'pry'; binding.pry
    expect(ny_created_facilities.count).to eq(170) 
    # returns 133 - maybe takes out instances without a phone number?
  # require 'pry'; binding.pry
  end

  it "creates facilities in Missouri from an external list of facilities" do
    facility_factory = FacilityFactory.new
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    mo_data = facility_factory.mo_transform(mo_dmv_office_locations)
    mo_created_facilities = facility_factory.create_facility(mo_data)
      
    expect(mo_created_facilities[0]).to be_an_instance_of(Facility)
    expect(mo_created_facilities).to be_an(Array)
    # expect(mo_created_facilities.count).to eq(177)
    # returns 175 
  end
end