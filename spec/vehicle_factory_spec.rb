require 'spec_helper'

RSpec.describe VehicleFactory do
  it "exists" do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)        
  end

  it ".create_vehicles" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    #what are you supposed to expect with limitless return
    # factory.create_vehicles(wa_ev_registrations)
    # require 'pry';binding.pry

  end
end
