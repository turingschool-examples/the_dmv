require './spec/spec_helper'

RSpec.describe DmvFactory do
  it "can create facility objects in colorado" do
    factory = DmvFactory.new
    co_dmv_facilities = DmvDataService.new.co_dmv_office_locations
    all_locations = factory.create_facilities(co_dmv_facilities)
    denver_dmv = all_locations.first

    expect(co_dmv_facilities.count).to eq(5)
    expect(denver_dmv[:id]).to eq("1")
    expect(denver_dmv[:address]).to eq("2855 Tremont Place")
    expect(denver_dmv[:zip]).to eq("80205")
    expect(denver_dmv[:phone]).to eq("(720) 865-4600")
  end

end
