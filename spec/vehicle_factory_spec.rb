require 'spec_helper'

require './lib/vehicle'
# pry(main)> require './lib/vehicle'
# #=> true
require './lib/vehicle_factory'
# pry(main)> require './lib/vehicle_factory'
# #=> true
require './lib/dmv_data_service'
# pry(main)> require './lib/dmv_data_service'
# #=> true


RSpec.configure do |config|
  config.formatter = :documentation
end

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
    
    example_1 = factory.create_vehicles(wa_ev_registrations)
    expect(example_1[0].vin).to eq("1N4AZ1BV0R")
    example_1.each do |vehicle|
      expect(vehicle).to be_an_instance_of(Vehicle)
      expect(vehicle).to respond_to(:vin)
      expect(vehicle).to respond_to(:year)
    end
  end

end

# pry(main)> wa_ev_registrations = DmvDataService.new.wa_ev_registrations
# #  [{:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
# #    :vin_1_10=>"JTDKN3DP8D",
# #    :dol_vehicle_id=>"229686908",
# #    :model_year=>"2013",
# #    :make=>"TOYOTA",
# #    :model=>"Prius Plug-in",
# #    ...},
# #    ...,
# #    {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
# #     :vin_1_10=>"1G1RD6E47D",
# #     :dol_vehicle_id=>"289314742",
# #     :model_year=>"2013",
# #     :make=>"CHEVROLET",
# #     :model=>"Volt",
# #     ...}]


# pry(main)> factory.create_vehicles(wa_ev_registrations)
#   #=> [#<Vehicle:0x000000012d3812f0 @engine=:ev, @make="TOYOTA", @model="Prius Plug-in", @plate_type=nil, @registration_date=nil, @vin="JTDKN3DP8D", @year="2013">,
#   #<Vehicle:0x000000012d3812a0 @engine=:ev, @make="TOYOTA", @model="Prius Prime", @plate_type=nil, @registration_date=nil, @vin="JTDKARFP9J", @year="2018">,
#   #<Vehicle:0x000000012d381200 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
#   #<Vehicle:0x000000012d381188 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
#   #<Vehicle:0x000000012d381138 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
#   # ...]
