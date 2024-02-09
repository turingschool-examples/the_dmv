require 'spec_helper'

RSpec.describe FacilityFactory do
  let (:factory) { FacilityFactory.new }
  let (:co_dmv_office_locations) { DmvDataService.new.co_dmv_office_locations }
  it 'exists' do
    expect(factory).to be_an_instance_of(FacilityFactory)
  end
end