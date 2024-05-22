require 'spec_helper'

RSpec.describe VehicleFactory do
  it "is an instance of the vehicle factory class" do
    factory = VehicleFactory.new
    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  it "can create vehicle objects from an external database" do
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory = VehicleFactory.new
    output = factory.create_vehicles(@wa_ev_registrations)
    expect(output).to be_an(Array)
    expect(output.first).to be_a(Vehicle)
  end


  
end