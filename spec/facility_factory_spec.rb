require 'spec_helper'

RSpec.describe FacilityFactory do
  it "exists" do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    factory.create_locations(co_dmv_office_locations)
    require 'pry';binding.pry
  end
end