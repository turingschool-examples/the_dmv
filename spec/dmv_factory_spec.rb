require "spec_helper"

RSpec.describe "#dmv_factory" do
  it "creates a dmv factory" do
    factory = DmvFactory.new
    expect(factory).to be_an_instance_of(Dmvfactory)
  end

  it "#creates a new facility" do
    factory = DmvFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    factory.create_facilities(co_dmv_office_locations)
  end
end
