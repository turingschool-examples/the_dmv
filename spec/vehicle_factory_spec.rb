require 'spec_helper'


RSpec.describe VehicleFactory do
  it "exists" do
    factory_1 = VehicleFactory.new
    expect(factory_1).to be_a VehicleFactory
end

it "has a create_vehicles method" do
  factory_1 = VehicleFactory.new
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  expect(factory_1.create_vehicles(wa_ev_registrations)).to be_a Array
end

it "has a most popular make/model attribute" do
  factory_1 = VehicleFactory.new
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  expect(factory_1.most_popular_make_model).to eq "" 
  factory_1.create_vehicles(wa_ev_registrations)
  expect(factory_1.most_popular_make_model).to eq("NISSAN, Leaf") 
end
end