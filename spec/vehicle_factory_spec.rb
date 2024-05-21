require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  it "is an instance of the Vehicle class" do
    factory = VehicleFactory.new
    
    expect(factory).to be_an_instance_of(VehicleFactory)
    # pry(main)> factory = VehicleFactory.new
    # #=> #<VehicleFactory:0x000000011c854810>
  end
  
  it "can create vehicle objects from database" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    wa_example = factory.create_vehicles(wa_ev_registrations)
    
    expect(wa_example[0].vin).to eq("1G1FZ6S08P")
    
    wa_example.each do |vehicle|
      expect(vehicle).to be_an_instance_of(Vehicle)
      expect(vehicle).to respond_to(:vin)
      expect(vehicle).to respond_to(:year)
    end
  end
end