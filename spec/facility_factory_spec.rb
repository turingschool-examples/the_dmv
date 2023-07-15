require 'spec_helper'

RSpec.describe FacilityFactory do
  it "exists" do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    factory.create_facilities(co_dmv_office_locations)
    expect(factory.facilities).to all be_a Facility
    expect(factory.facilities).to be_an Array
  end

  it "NY" do
    factory = FacilityFactory.new
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    factory.create_facilities(ny_dmv_office_locations)
    expect(factory.facilities).to all be_a Facility
    expect(factory.facilities).to be_an Array
  end

  it "MO" do
    factory = FacilityFactory.new
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    factory.create_facilities(mo_dmv_office_locations)
    # require 'pry';binding.pry
    expect(factory.facilities).to all be_a Facility
    expect(factory.facilities).to be_an Array
  end

end