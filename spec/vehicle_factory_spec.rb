# typed: ignore

require "rspec"
require "./spec/spec_helper"
require "./lib/vehicle_factory"

RSpec.describe VehicleFactory do
  before(:each) do
    @vehicle_factory = VehicleFactory.new
  end

  it "exists" do
    puts "todo: add tests"
  end
end
