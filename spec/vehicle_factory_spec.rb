
 require './lib/vehicle'
 require './lib/vehicle_factory'
 require './lib/dmv_data_service'

 RSpec.describe Vehicle_factory do
    before (:each) do

    @factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    describe "#initialize" do
     it "can initialize" do
        factory = VehicleFactory.new
     end   
    end


    describe "create_vehicles" do
      it "can create vehicles from gov data set"do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(@factory.create_vehicles(wa_ev_registrations).first).to be_a(Vehicle)
      #only info to go off of? first spot is a vehicle in an array, the rest is gov data
      expect(@factory.create_vehicles(wa_ev_registrations).array).to be_a(Array)
      end
    end
  end
end