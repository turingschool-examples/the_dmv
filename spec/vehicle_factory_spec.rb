require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'creates new vehicles' do
    factory = VehicleFactory.new
    factory.create_vehicles
    expect(factory.create_vehicles).to_not eq(nil)
  end
end
