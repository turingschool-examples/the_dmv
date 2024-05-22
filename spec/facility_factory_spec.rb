require 'spec_helper'

RSpec.describe FacilityFactory do
  it "is an instance of the facility factory class" do
    factory = FacilityFactory.new
    expect(factory).to be_an_instance_of(FacilityFactory)
  end

  it "can create facility objects from an external database" do
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    factory = FacilityFactory.new

    output1 = factory.create_facility(@co_dmv_office_locations)
    output2 = factory.create_facility(@ny_dmv_office_locations)
    output3 = factory.create_facility(@mo_dmv_office_locations)

    expect(output1).to be_an(Array)
    expect(output1.first).to be_a(Facility)

    expect(output2).to be_an(Array)
    expect(output2.first).to be_a(Facility)

    expect(output3).to be_an(Array)
    expect(output3.first).to be_a(Facility)
  end

  

end