require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do

  it "exists" do
    factory = VehicleFactory.new

    expect(factory).to be_an_instance_of(VehicleFactory)
  end
  
end