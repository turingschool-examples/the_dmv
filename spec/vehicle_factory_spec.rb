require './lib/vehicle/'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do

  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    # factory.create_vehicles(wa_ev_registrations)
  end
  
  it "is an array" do
    expect(@wa_ev_registrations).to be_a(Array)
  end

  it "is an array of hashes" do
    for i in 0..@wa_ev_registrations.count - 1
      expect(@wa_ev_registrations[i]).to be_a(Hash)
    end
  end

 

end

  # it "parses data into an array of vehicles" do

  #   for i in 0..wa_vehicles.length - 1
  #     expect(wa_vehicles[i]).to be_a(Vehicle)
  #   end

#     p wa_vehicles.length
  # end