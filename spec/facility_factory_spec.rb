require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
   @or_dmv = DmvDataService.new.or_dmv_office_locations
   @f_factory = FacilityFactory.new
  end

  it "exists" do
    expect(@f_factory).to be_an_instance_of(FacilityFactory)
  end

  it "can create facilities from OR database" do
    @or_dmv_1 = Facility.new({name: "Albany DMV", address: "2242 Santiam Hwy SE, Ashland OR, 97103", phone: "541-967-2014"})
    @created_facilities = @f_factory.or_facility_creator(@or_dmv)
    expect(@created_facilities[0].name).to eq(@or_dmv_1.name)
    expect(@created_facilities[0].address).to eq(@or_dmv_1.address)
    expect(@created_facilities[0].phone).to eq(@or_dmv_1.phone)
  end

end

