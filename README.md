# The DMV

This is the starter repo for the BE Mod1 DMV project.

## Outline
* [Iteration 1](#iteration-1---learning-an-existing-codebase)
* [Iteration 2](#iteration-2---adding-features-and-creating-objects-from-data-sources)
* [Iteration 3](#iteration-3---creating-objects-from-multiple-data-sets-and-analyzing-our-data)
* [Iteration 4](#iteration-4---extensions)
 

### Links
* [The DMV Project Home](https://backend.turing.edu/module1/projects/dmv/index)
* [The DMV - Requirements](https://backend.turing.edu/module1/projects/dmv/requirements)
* [Evaluation Rubric](https://github.com/turingschool/backend-curriculum-site/blob/gh-pages/module1/projects/dmv/rubric.md)

## [Iteration 1 - Learning an Existing Codebase](https://backend.turing.edu/module1/projects/dmv/iteration_1)
### Exploring an Existing Codebase
We’ll start this iteration by taking some time to get to know the code we’re starting with. You didn’t write this code, so take a look around.

You should explore:

* The classes available to you
* The tests that already exist for these classes
* Take note of the project folder structure. Is there anything you haven’t seen before?

**Debugging**<br>
If you haven’t already, run the tests now. You should see some failing tests. Work through fixing the code until the tests pass. You only change the application code, not the tests. It might be helpful to run each test one at a time and fix one by one.

_**TIPS**_

* You should not have any failures in `spec/dmv_data_service_spec.rb`. If you do, please notify an instructor.
* You should not change any of the existing tests for the debugging portion of the project. Change the application code, not the specs.

You should see the following errors:

```ruby
Failed examples:

rspec ./spec/dmv_spec.rb:12 # Dmv#initialize can initialize
rspec ./spec/dmv_spec.rb:19 # Dmv#add facilities can add available facilities
rspec ./spec/dmv_spec.rb:27 # Dmv#facilities_offering_service can return list of facilities offering a specified Service
rspec ./spec/facility_spec.rb:8 # Facility#initialize can initialize
rspec ./spec/facility_spec.rb:18 # Facility#add service can add available services
rspec ./spec/vehicle_spec.rb:10 # Vehicle#initialize can initialize
```

**Reflection**<br>
Before moving on to the next portion of this iteration, reflect on your process of learning a new codebase. Take notes on the following questions so that you can speak to these themes at the end of the project:

** Please add the below reflections to your `Mod 1 Project Reflections` gist within the `Second Solo Project` section. **

1. Describe the steps you took to dig in to this code base. What was your process? If you don’t feel you had a process, define one that you might like to try next time.
1. What was hard about working with code you did not write?
1. What was easier than you expected about jumping in to an unfamiliar codebase? What made it easy? If nothing felt easy, what would’ve helped you feel more comfortable more quickly?

### Add a Registrant Class

Let’s create a `Registrant` class so our visitors can use our services. Your registrant should have a `name`, `age`, `permit`, and `license_data` attributes. If no value is provided for `permit`, it should [default to false](https://medium.com/@sologoubalex/parameters-with-default-values-in-ruby-74cd0e830681). We should also be able to change a `permit` from `false` to `true` after a `Registrant` has earned their permit. There is no age limit to when someone can earn their permit.

You are required to use TDD to create your class. Use the interaction pattern to determine what a method should do and write one or more tests to verify that expected behavior. Then you can implement the method. You should always write code with the purpose of making a test pass.

Use the following interaction pattern to build out your `Registrant` class

```ruby
pry(main)> require './lib/registrant'
#=> true

pry(main)> registrant_1 = Registrant.new('Bruce', 18, true )
#=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

pry(main)> registrant_2 = Registrant.new('Penny', 15 )
#=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

pry(main)> registrant_1.name
#=> "Bruce"

pry(main)> registrant_1.age
#=> 18

pry(main)> registrant_1.permit?
#=> true

pry(main)> registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> registrant_2.name
#=> "Penny"

pry(main)> registrant_2.age
#=> 15

pry(main)> registrant_2.permit?
#=> false

pry(main)> registrant_2.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> registrant_2.earn_permit

pry(main)> registrant_2.permit?
#=> true
```

---

## [Iteration 2 - Adding Features and Creating Objects from Data Sources](https://backend.turing.edu/module1/projects/dmv/iteration_2)

### Test Driven Development

In this iteration, you are required to use TDD to add functionality to your classes. Use the interaction pattern to determine what a method should do and write one or more tests to verify that expected behavior. Then you can implement the method. You should always write code with the purpose of making a test pass.

Now that we have our new `Registrant` class, let's add some functionality to our `Facility` class so a specific DMV facility can administer services to our registrants.
  * The DMV allows facilities to perform the following services:
    * Register a vehicle
      * Vehicles have the following rules:
        * Vehicles 25 years old or older are considered antique and cost $25 to register
        * Electric Vehicles (EV) cost $200 to register
        * All other vehicles cost $100 to register
        * A vehicle's `plate_type` should be set to `:regular`, `:antique`, or `:ev` upon successful registration.
    * Administer a written test
      * A written test can only be administered to registrants with a permit and who are at least 16 years of age
    * Administer a road test
      * A road test can only be administered to registrants who have passed the written test
      * For simplicity's sake, Registrants who qualify for the road test automatically earn a license
    * Renew a driver's license
      * A license can only be renewed if the registrant has already passed the road test and earned a license

**NOTE: A facility must offer a service in order to perform it. Just because the DMV allows facilities to perform certain services, does not mean that every facility provides every service.**


#### Vehicle Registration
Use the following interaction pattern to help build this functionality:

```ruby
pry(main)> require './lib/facility'
#=> true

pry(main)> require './lib/vehicle'
#=> true

pry(main)> facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
#=> #<Facility:0x00000001258a3d80 @address="2242 Santiam Hwy SE Albany OR 97321", @collected_fees=0, @name="Albany DMV Office", @phone="541-967-2014", @registered_vehicles=[], @services=[]>

pry(main)> facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
#=> #<Facility:0x000000012581e3d8 @address="600 Tolman Creek Rd Ashland OR 97520", @collected_fees=0, @name="Ashland DMV Office", @phone="541-776-6092", @registered_vehicles=[], @services=[]>

pry(main)> cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
#=> #<Vehicle:0x0000000135a48b08 @engine=:ice, @make="Chevrolet", @model="Cruz", @plate_type=nil, @registration_date=nil, @vin="123456789abcdefgh", @year=2012>

pry(main)> bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
#=> #<Vehicle:0x0000000125832180 @engine=:ev, @make="Chevrolet", @model="Bolt", @plate_type=nil, @registration_date=nil, @vin="987654321abcdefgh", @year=2019>

pry(main)> camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
#=> #<Vehicle:0x0000000135adb610 @engine=:ice, @make="Chevrolet", @model="Camaro", @plate_type=nil, @registration_date=nil, @vin="1a2b3c4d5e6f", @year=1969>

pry(main)> facility_1.add_service('Vehicle Registration')
#=> ["Vehicle Registration"]

pry(main)> cruz.registration_date
#=> nil

pry(main)> facility_1.registered_vehicles
#=> []

pry(main)> facility_1.collected_fees
#=> 0

pry(main)> facility_1.register_vehicle(cruz)
#=> [#<Vehicle:0x0000000135a48b08...>]

pry(main)> cruz.registration_date
#=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

pry(main)> cruz.plate_type
#=> :regular

pry(main)> facility_1.registered_vehicles
#=> [#<Vehicle:0x0000000135a48b08...>]

pry(main)> facility_1.collected_fees
#=> 100

pry(main)> facility_1.register_vehicle(camaro)
#=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>]

pry(main)> camaro.registration_date
#=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

pry(main)> camaro.plate_type
#=> :antique

pry(main)> facility_1.register_vehicle(bolt)
#=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

pry(main)> bolt.registration_date
#=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

pry(main)> bolt.plate_type
#=> :ev

pry(main)> facility_1.registered_vehicles
#=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

pry(main)> facility_1.collected_fees
#=> 325

pry(main)> facility_2.registered_vehicles
#=> []

pry(main)> facility_2.services
#=> []

pry(main)> facility_2.register_vehicle(bolt)
#=> nil

pry(main)> facility_2.registered_vehicles
#=> []

pry(main)> facility_2.collected_fees
#=> 0

```

#### Getting a Driver's License
Use the following interaction pattern to help build this functionality:

```ruby
pry(main)> require './lib/registrant'
#=> true

pry(main)> require './lib/facility'
#=> true

pry(main)> registrant_1 = Registrant.new('Bruce', 18, true )
#=> #<Registrant:0x000000012d863e80 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

pry(main)> registrant_2 = Registrant.new('Penny', 16 )
#=> #<Registrant:0x000000012d94ba78 @age=16, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

pry(main)> registrant_3 = Registrant.new('Tucker', 15 )
#=> #<Registrant:0x000000012d8b0e38 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Tucker", @permit=false>

pry(main)> facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
#=> #<Facility:0x000000012d817f58 @address="2242 Santiam Hwy SE Albany OR 97321", @collected_fees=0, @name="Albany DMV Office", @phone="541-967-2014", @registered_vehicles=[], @services=[]>

pry(main)> facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
#=> #<Facility:0x000000012d9138a8 @address="600 Tolman Creek Rd Ashland OR 97520", @collected_fees=0, @name="Ashland DMV Office", @phone="541-776-6092", @registered_vehicles=[], @services=[]>

#Written Test

pry(main)> registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> registrant_1.permit?
#=> true

pry(main)> facility_1.administer_written_test(registrant_1)
#=> false

pry(main)> registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> facility_1.add_service('Written Test')
#=> ["Written Test"]

pry(main)> facility_1.administer_written_test(registrant_1)
#=> true

pry(main)> registrant_1.license_data
#=> {:written=>true, :license=>false, :renewed=>false}

pry(main)> registrant_2.age
#=> 16

pry(main)> registrant_2.permit?
#=> false

pry(main)> facility_1.administer_written_test(registrant_2)
#=> false

pry(main)> registrant_2.earn_permit

pry(main)> facility_1.administer_written_test(registrant_2)
#=> true

pry(main)> registrant_2.license_data
#=> {:written=>true, :license=>false, :renewed=>false}

pry(main)> registrant_3.age
#=> 15

pry(main)> registrant_3.permit?
#=> false

pry(main)> facility_1.administer_written_test(registrant_3)
#=> false

pry(main)> registrant_3.earn_permit

pry(main)> facility_1.administer_written_test(registrant_3)
#=> false

pry(main)> registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

# Road Test

pry(main)> facility_1.administer_road_test(registrant_3)
#=> false

pry(main)> registrant_3.earn_permit

pry(main)> facility_1.administer_road_test(registrant_3)
#=> false

pry(main)> registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> facility_1.administer_road_test(registrant_1)
#=> false

pry(main)> facility_1.add_service('Road Test')
#=> ["Written Test", "Road Test"]

pry(main)> facility_1.administer_road_test(registrant_1)
#=> true

pry(main)> registrant_1.license_data
#=> {:written=>true, :license=>true, :renewed=>false}

pry(main)> facility_1.administer_road_test(registrant_2)
#=> true

pry(main)> registrant_2.license_data
#=> {:written=>true, :license=>true, :renewed=>false}

# Renew License

pry(main)> facility_1.renew_drivers_license(registrant_1)
#=> false

pry(main)> facility_1.add_service('Renew License')
#=> ["Written Test", "Road Test", "Renew License"]

pry(main)> facility_1.renew_drivers_license(registrant_1)
#=> true

pry(main)> registrant_1.license_data
#=> {:written=>true, :license=>true, :renewed=>true}

pry(main)> facility_1.renew_drivers_license(registrant_3)
#=> false

pry(main)> registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

pry(main)> facility_1.renew_drivers_license(registrant_2)
#=> true

pry(main)> registrant_2.license_data
#=> {:written=>true, :license=>true, :renewed=>true}
```

### Reading from External Data Sets

You might have noticed a little bit of code in a class called `DmvDataService`. This class is responsible for retrieving data from an [API](https://www.freecodecamp.org/news/what-is-an-api-in-english-please-b880a3214a82). You do not need to write or change any code in this class. You will only use it as described below for accessing data. This class will give us a dataset to use with the other classes we have here in our DMV project.

With the provided data set in the `DmvDataService` class (Washington State EV Vehicle Registration data), create `Vehicle` objects using your existing `Vehicle` class. You might choose to build this functionality within `Vehicle` or create a new class. The interaction pattern below demonstrates using a new class. Since the provided data set is for Electric Vehicle Registrations in Washington State, you can set the vehicle's `engine` attribute to `:ev` for every vehicle.

As detailed in the interaction pattern, you can access the data you need with the following code snippet.

```ruby
DmvDataService.new.wa_ev_registrations
```

This already exists in the starting repository. Spend a little time exploring the data set in a `pry` session. What is the datatype? What information is here? How can we access data that is nested more deeply?

Use TDD and the following interaction pattern to guide your build:
```ruby
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

```

---

## [Iteration 3 - Creating Objects from Multiple Data Sets and Analyzing Our Data](https://backend.turing.edu/module1/projects/dmv/iteration_3)

### Create Facility Objects from an External Data Source

Let's do that again with different data! Similar to when you created `Vehicle` objects from the data about EV Registrations in Washington, you'll create DMV `Facility` objects with data about DMV Facilities. Let's start with Oregon. You can follow the same pattern as you did for vehicles to access the data.

```ruby
DmvDataService.new.or_dmv_office_locations
```

The data should look something like this:
```ruby
pry(main)> DmvDataService.new.or_dmv_office_locations
=> [{:title=>"Albany DMV Office",
  :zip_code=>"97321",
  :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx",
  :type=>"DMV Location",
  :phone_number=>"541-967-2014",
  :agency=>"Transportation, Department of ",
  :location_1=>
   {:latitude=>"44.632897",
    :longitude=>"-123.077928",
    :human_address=>"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}},
 {:title=>"Ashland DMV Office",
  :zip_code=>"97520",
  :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/ashland.aspx",
  :type=>"DMV Location",
  :phone_number=>"541-776-6092",
  :agency=>"Transportation, Department of ",
  :location_1=>
   {:latitude=>"42.184549",
    :longitude=>"-122.671018",
    :human_address=>"{\"address\": \"600 Tolman Creek Rd\", \"city\": \"Ashland\", \"state\": \"OR\", \"zip\": \"97520\"}"}},
    ...]
```

### Create Facility objects from Multiple Data Sources

Cool! Now you can handle creating `Facility` objects from one data source. But what about another state? The fun thing about data is that every entity that manages a data set has their own rules. Refactor your code to allow for the creation of `Facility` objects from another data source - NY State DMV Facilities. You should be able to create objects from ALL provided data sources. This means that by changing your code to work for the New York dataset, it should also continue to work for the Oregon dataset. Once you have New York working, add in Missouri! We **STRONGLY** recommend doing one at a time. Make sure all your past tests for the previous dataset still pass when you're done adding code for your new dataset.

You can access these data sets with the following code:

```ruby
new_york_facilities = DmvDataService.new.ny_dmv_office_locations

missouri_facilities = DmvDataService.new.mo_dmv_office_locations
```

---

## [Iteration 4 - Extensions](https://backend.turing.edu/module1/projects/dmv/iteration_4)

### Extensions
#### Option 1
Find your own data set to work with and do something interesting with it. If you choose this option, check in with an instructor before starting.
  * Here's a good place to start your data hunt: [Data.gov](https://catalog.data.gov/dataset)


#### Option 2
Calculate some analytics about your existing data sets:
  * EV Registrations:
    * Find the most popular make/model registered
    * Count of registered vehicle for a model year
    * County with most registered vehicles

  * Facilities:
    * Add in a few more helpful attributes.
      * What are the daily hours for each facility?
      * For the states that provide (Missouri), which holidays are they closed?

  * Vehicles:
    * Add in a second data source for vehicles and create some `Vehicle` objects from NY State Registration Data: https://data.ny.gov/resource/w4pv-hbkt.json