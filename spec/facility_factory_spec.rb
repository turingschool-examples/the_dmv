require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
   @or_dmv = DmvDataService.new.or_dmv_office_locations
   @f_factory = FacilityFactory.new
  end

  it "exists" do
    expect(@f_factory).to be_an_instance_of(FacilityFactory)
  end

  it ""

end
