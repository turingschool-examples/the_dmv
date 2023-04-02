# The DMV

## Reflection

- Describe the steps you took to dig in to this code base. What was your process? If you don’t feel you had a process, define one that you might like to try next time

  - I took several steps to get this far in fixing the dmv, vehicle and facility files. The first thing I did was identify which problems there were by using `rspec` in the main folder - that showed me all of the failures that existed in each of the files. From there, I tried to identify which files were dependent on which files before it and decided to start with the `facility`. I was  first confounded by trying to set up a new class with hash attributes, which was something I had never done before, so my instinct was to set them up using individual attributes. From there, my process was to try to debug and let the error/failure messages guide me. My first clue was that initializing a new facility was only expecting 1 argument, but I was giving it multiple arguments. After quickly googling I found that I wanted to setup the initialize method with a hash, and then use a special syntax to access those details in the attributes (I've quickly attempted to recreate a similar Vehicle class below to see if the different syntax stuck in memory):

  ```ruby
  class Vehicle
    attr_reader :year,
                :make,
                :model
    def intialize({:year, :make, :model})
      @year   = vehicle_details[:year]
      @make   = vehicle_detils[:make]
      @model  = vehicle_details[:make]
    end
  end
  ```

- What was hard about working with code you did not write?

  - What was hard about working with code that I didn't write was that I didn't really know where to begin at first. After I slowed my brain down and tried to eat the elephant, it became overwhelming seeing all of the errors that were there, so I just tried to continue taking it one bite at a time. I think that especially if I hadn't had an interaction pattern to follow, or knew that the source of truth was the test, then it would get really overwhelming really quickly to try to figure out what was happening and why.

- What was easier than you expected about jumping in to an unfamiliar codebase? What made it easy? If nothing felt easy, what would’ve helped you feel more comfortable more quickly?

  - Similar to above, what was easier about working with unfamiliar codebases was that I could pick some clues from the codebase to figure out something else that was going wrong. For instance, I took some clues from the vehicle class to help figure out the facility class. Working with a codebase was also easier because I had so much of the work done already. It nothing had felt easy, I think that chatting it through with another developer, or the former developer if that was an option, might have made it feel a little more familiar. Having a debugging tool to see what the code was doing was ***invaluable***. I'm sure it would have taken quite a bit longer to solve some of those bugs had it not been for `require 'pry'; binding.pry`.

# Notes to Self

## Iteration 1

- Wtf is `require 'date'` in line 1 of the vehicle class? Is date a standard gem file that's being accessed in `Date.antique?`
- Utilizing the `attr_accessor` instead of `attr_reader` in vehicle class for the registration date since, presumably, it will need to be accessed/edited later on when that car is registered

## Iteration 2

- Why is the facility class utlizing `@facility` instead of `facility`?
- With starting the reading from external data sets...
  - I think that the facility class may need a `new_drivers_license` method based on line 23 from the facility spec?
- In a `pry` in `dmv_data_service_spec` I could access specific information in the array using the following:

```ruby
[7] pry(RSpec::ExampleGroups::DmvDataService)> DmvDataService.new.wa_ev_registrations[5]
=> {:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
 :vin_1_10=>"WVWKR7AU7K",
 :dol_vehicle_id=>"296928922",
 :model_year=>"2019",
 :make=>"VOLKSWAGEN",
 :model=>"e-Golf",
 :vehicle_primary_use=>"Passenger",
 :electric_range=>"125",
 :odometer_reading=>"0",
 :odometer_code=>"Odometer reading is not collected at time of renewal",
 :new_or_used_vehicle=>"Used",
 :sale_price=>"0",
 :base_msrp=>"0",
 :transaction_type=>"Registration Renewal",
 :transaction_date=>"2021-09-13T00:00:00.000",
 :transaction_year=>"2021",
 :county=>"King",
 :city=>"REDMOND",
 :state_of_residence=>"WA",
 :zip=>"98052",
 :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
 :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
 :meets_2019_hb_2042_electric_range_requirement=>true,
 :meets_2019_hb_2042_sale_date_requirement=>false,
 :meets_2019_hb_2042_sale_price_value_requirement=>false,
 :_2019_hb_2042_battery_range_requirement=>"Meets battery range requirement",
 :_2019_hb_2042_purchase_date_requirement=>"Non-sale, registration transaction",
 :_2019_hb_2042_sale_price_value_requirement=>"Non-sale, registration transaction",
 :electric_vehicle_fee_paid=>"Yes",
 :transportation_electrification_fee_paid=>"Yes",
 :hybrid_vehicle_electrification_fee_paid=>"No",
 :census_tract_2020=>"53033032330",
 :legislative_district=>"45",
 :electric_utility=>"PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)"}
 ```
 ...
 ```ruby
[14] pry(RSpec::ExampleGroups::DmvDataService)> DmvDataService.new.wa_ev_registrations[5][:make]
=> "VOLKSWAGEN"
```
