# typed: ignore

require "rspec"
require "./spec/spec_helper"
require "./lib/vehicle_factory"

RSpec.describe VehicleFactory do
  before(:each) do
    @vehicle_factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  it "exists" do
    expect(@vehicle_factory).to be_an_instance_of(VehicleFactory)
  end
end
