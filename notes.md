# Reading from External Data Sets

You might have noticed a little bit of code in a class called DmvDataService. This class is responsible for retrieving data from an API. You do not need to write or change any code in this class. You will only use it as described below for accessing data. This class will give us a dataset to use with the other classes we have here in our DMV project.

With the provided data set in the DmvDataService class (Washington State EV Vehicle Registration data), create Vehicle objects using your existing Vehicle class. You might choose to build this functionality within Vehicle or create a new class. The interaction pattern below demonstrates using a new class. Since the provided data set is for Electric Vehicle Registrations in Washington State, you can set the vehicle’s engine attribute to :ev for every vehicle.

As detailed in the interaction pattern, you can access the data you need with the following code snippet: DmvDataService.new.wa_ev_registrations

This already exists in the starting repository. Spend a little time exploring the data set in a pry session. What is the datatype? What information is here? How can we access data that is nested more deeply?

# Use TDD and the following interaction pattern to guide your build:

pry(main)> require './lib/vehicle'
#=> true

pry(main)> require './lib/vehicle_factory'
#=> true

pry(main)> require './lib/dmv_data_service'
#=> true

pry(main)> factory = VehicleFactory.new
#=> #<VehicleFactory:0x000000011c854810>

pry(main)> wa_ev_registrations = DmvDataService.new.wa_ev_registrations
#  [{:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
#    :vin_1_10=>"JTDKN3DP8D",
#    :dol_vehicle_id=>"229686908",
#    :model_year=>"2013",
#    :make=>"TOYOTA",
#    :model=>"Prius Plug-in",
#    ...},
#    ...,
#    {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
#     :vin_1_10=>"1G1RD6E47D",
#     :dol_vehicle_id=>"289314742",
#     :model_year=>"2013",
#     :make=>"CHEVROLET",
#     :model=>"Volt",
#     ...}]


pry(main)> factory.create_vehicles(wa_ev_registrations)
  #=> [#<Vehicle:0x000000012d3812f0 @engine=:ev, @make="TOYOTA", @model="Prius Plug-in", @plate_type=nil, @registration_date=nil, @vin="JTDKN3DP8D", @year="2013">,
  #<Vehicle:0x000000012d3812a0 @engine=:ev, @make="TOYOTA", @model="Prius Prime", @plate_type=nil, @registration_date=nil, @vin="JTDKARFP9J", @year="2018">,
  #<Vehicle:0x000000012d381200 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
  #<Vehicle:0x000000012d381188 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
  #<Vehicle:0x000000012d381138 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
  # ...]
