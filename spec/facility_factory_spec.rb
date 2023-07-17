require './spec/spec_helper'

describe FacilityFactory do
  it "exist" do
    colorado = FacilityFactory.new
    expect(colorado).to be(FacilityFactory)
  end

  it ""
