require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'creates new vehicles' do
    factory = VehicleFactory.new
    cars = factory.create_vehicles
    cars.each do |car|
    expect(car).to be_an_instance_of(Vehicle)
    expect(car.model).to_not eq(nil)
    end
    expect(factory.create_vehicles).to_not eq(nil)
  end
end
