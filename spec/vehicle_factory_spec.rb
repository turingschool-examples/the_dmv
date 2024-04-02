require 'spec_helper'

RSpec.configure do |config|
config.formatter = :documentation
end

RSpec.describe VehicleFactory do

  it "can initialize" do
    expect(factory = VehicleFactory.new).to be_an_instance_of(VehicleFactory) ##<VehicleFactory:0x000000011c854810>
  end

  it 'can create a vehicle' do
    factory = VehicleFactory.new
    registration = [{
      :electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"7SAYGDEE0P",
      :dol_vehicle_id=>"245533788",
      :model_year=>"2023",
      :make=>"TESLA",
      :model=>"Model Y",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"0",
      :odometer_reading=>"15",
      :odometer_code=>"Actual Mileage",
      :new_or_used_vehicle=>"New",
      :sale_price=>"51630",
      :date_of_vehicle_sale=>"2023-06-06T00:00:00.000",
      :base_msrp=>"0",
      :transaction_type=>"Original Title",
      :transaction_date=>"2023-06-28T00:00:00.000",
      :transaction_year=>"2023"
      }]

      cars = factory.create_vehicles(registration)
      expect(cars).to all be_an_instance_of(Vehicle)
      expect(cars[0].vin).to eq("7SAYGDEE0P") #vin is getting called on a Vehicle class, it's a Vehicle method
      expect(cars[0].year).to eq("2023")
      expect(cars[0].model).to eq("Model Y")
      expect(cars[0].make).to eq("TESLA")
      expect(cars[0].engine).to eq(:ev)
      expect(cars[0].registration_date).to eq(nil)
  end

  it 'can create vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(factory.create_vehicles(wa_ev_registrations)).to all be_an_instance_of(Vehicle)
  end
end