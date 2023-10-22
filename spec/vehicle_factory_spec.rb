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

it "has most popular year attribute" do
  factory_1 = VehicleFactory.new
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  factory_1.create_vehicles(wa_ev_registrations)
  expect(factory_1.most_common_year).to eq(2021)
  expect(factory_1.most_common_year).not_to eq(2020)
  expect(factory_1.year_counter(2015)).to eq(81)
end

it "has a method for most common county" do
  factory_1 = VehicleFactory.new
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  factory_1.create_vehicles(wa_ev_registrations)
  expect(factory_1.most_common_county).to eq("King")
end


end