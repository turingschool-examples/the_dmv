require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @or_dmv = DmvDataService.new.or_dmv_office_locations
  end
end
