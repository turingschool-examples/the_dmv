require 'spec_helper'

RSpec.describe VehicleFactory do
  describe 'initialize' do
    vehicle_factory = VehicleFactory.new
  end

  describe 'create_vehicles' do
    it "can create cars from registrations"


    expect(vehicles).to eq([car])
  end
#take info
vehicle_info_array = sort info to only vin, year, make, model, engine
vehicle_info_array.map |vehicle_info| Car.new(vehicle_info)
end