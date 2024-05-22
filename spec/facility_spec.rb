require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end
end

require './lib/facility' = true

require './lib/vehicle' = true

facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
@address = "2855 Tremont Place Suite 118 Denver CO 80205", 
@name = "DMV Tremont Branch", 
@phone = "(720) 865-4600", 
@services = []

facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
@address = "4685 Peoria Street Suite 101 Denver CO 80239", 
@name = "DMV Northeast Branch", 
@phone = "(720) 865-4600", 
@services = []

cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
@engine = :ice, 
@make = "Chevrolet", 
@model = "Cruz", 
@plate_type = nil, 
@registration_date = nil, 
@vin = "123456789abcdefgh", 
@year = 2012

bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
@engine = :ev, 
@make = "Chevrolet", 
@model = "Bolt", 
@plate_type = nil, 
@registration_date = nil, 
@vin = "987654321abcdefgh", 
@year = 2019

camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
@engine = :ice, 
@make = "Chevrolet", 
@model = "Camaro", 
@plate_type = nil, 
@registration_date = nil, 
@vin = "1a2b3c4d5e6f", 
@year = 1969

facility_1.add_service('Vehicle Registration') = ["Vehicle Registration"]

cruz.registration_date = nil

facility_1.registered_vehicles = []

facility_1.collected_fees = 0

facility_1.register_vehicle(cruz)
# #=> [#<Vehicle:0x0000000135a48b08...>]

cruz.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

cruz.plate_type = :regular

facility_1.registered_vehicles
# #=> [#<Vehicle:0x0000000135a48b08...>]

facility_1.collected_fees = 100

facility_1.register_vehicle(camaro)
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>]

camaro.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

camaro.plate_type = :antique

facility_1.register_vehicle(bolt)
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

bolt.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

bolt.plate_type = :ev

facility_1.registered_vehicles
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

facility_1.collected_fees = 325

facility_2.registered_vehicles = []

facility_2.services = []

facility_2.register_vehicle(bolt) = nil

facility_2.registered_vehicles = []

facility_2.collected_fees = 0


require './lib/registrant' = true
require './lib/facility' = true

registrant_1 = Registrant.new('Bruce', 18, true )
@age = 18, 
@license_data = {:written=>false, :license=>false, :renewed=>false}, 
@name = "Bruce", 
@permit = true

registrant_2 = Registrant.new('Penny', 16 )
@age = 16, 
@license_data = {:written=>false, :license=>false, :renewed=>false}, 
@name = "Penny", 
@permit = false

registrant_3 = Registrant.new('Tucker', 15 )
@age = 15, 
@license_data = {:written=>false, :license=>false, :renewed=>false}, 
@name = "Tucker", 
@permit = false

facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
@address = "2855 Tremont Place Suite 118 Denver CO 80205", 
@name = "DMV Tremont Branch", 
@phone = "(720) 865-4600", 
@services = []

facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
@address = "4685 Peoria Street Suite 101 Denver CO 80239", 
@name = "DMV Northeast Branch", 
@phone = "(720) 865-4600", 
@services = []

# #Written Test

registrant_1.license_data = {:written=>false, :license=>false, :renewed=>false}

registrant_1.permit? = true

facility_1.administer_written_test(registrant_1) = false

registrant_1.license_data = {:written=>false, :license=>false, :renewed=>false}

facility_1.add_service('Written Test') = ["Written Test"]

facility_1.administer_written_test(registrant_1) = true

registrant_1.license_data = {:written=>true, :license=>false, :renewed=>false}

registrant_2.age = 16

registrant_2.permit? = false

facility_1.administer_written_test(registrant_2) = false

registrant_2.earn_permit = false

facility_1.administer_written_test(registrant_2) = true

registrant_2.license_data = {:written=>true, :license=>false, :renewed=>false}

registrant_3.age = 15

registrant_3.permit? = false

facility_1.administer_written_test(registrant_3) = false

registrant_3.earn_permit = false

facility_1.administer_written_test(registrant_3) = false

registrant_3.license_data = {:written=>false, :license=>false, :renewed=>false}

# # Road Test

facility_1.administer_road_test(registrant_3) = false

registrant_3.earn_permit = false

facility_1.administer_road_test(registrant_3) = false

registrant_3.license_data = {:written=>false, :license=>false, :renewed=>false}

facility_1.administer_road_test(registrant_1) = false

facility_1.add_service('Road Test') = ["Written Test", "Road Test"]

facility_1.administer_road_test(registrant_1) = true

registrant_1.license_data = {:written=>true, :license=>true, :renewed=>false}

facility_1.administer_road_test(registrant_2) = true

registrant_2.license_data = {:written=>true, :license=>true, :renewed=>false}

# # Renew License

facility_1.renew_drivers_license(registrant_1) = false

facility_1.add_service('Renew License') = ["Written Test", "Road Test", "Renew License"]

facility_1.renew_drivers_license(registrant_1) = true

registrant_1.license_data = {:written=>true, :license=>true, :renewed=>true}

facility_1.renew_drivers_license(registrant_3) = false

registrant_3.license_data = {:written=>false, :license=>false, :renewed=>false}

facility_1.renew_drivers_license(registrant_2) = true

registrant_2.license_data = {:written=>true, :license=>true, :renewed=>true}


require './lib/vehicle' = true

require './lib/vehicle_factory' = true

require './lib/dmv_data_service' = true

factory = VehicleFactory.new
# #=> #<VehicleFactory:0x000000011c854810>

wa_ev_registrations = DmvDataService.new.wa_ev_registrations
   [{:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
     :vin_1_10=>"JTDKN3DP8D",
     :dol_vehicle_id=>"229686908",
     :model_year=>"2013",
     :make=>"TOYOTA",
     :model=>"Prius Plug-in",
     ...},
     ...,
     {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
      :vin_1_10=>"1G1RD6E47D",
      :dol_vehicle_id=>"289314742",
      :model_year=>"2013",
      :make=>"CHEVROLET",
      :model=>"Volt",
      ...}]


 factory.create_vehicles(wa_ev_registrations)
   @engine = :ev, 
   @make = "TOYOTA", 
   @model = "Prius Plug-in", 
   @plate_type = nil, 
   @registration_date = nil, 
   @vin = "JTDKN3DP8D", 
   @year ="2013",

   @engine = :ev, 
   @make = "TOYOTA", 
   @model = "Prius Prime", 
   @plate_type = nil, 
   @registration_date = nil, 
   @vin = "JTDKARFP9J", 
   @year = "2018",

   @engine = :ev, 
   @make = "NISSAN", 
   @model = "Leaf", 
   @plate_type = nil, 
   @registration_date = nil, 
   @vin = "1N4AZ1CP0J", 
   @year = "2018",

   @engine = :ev, 
   @make = "NISSAN", 
   @model = "Leaf", 
   @plate_type = nil, 
   @registration_date = nil, 
   @vin = "1N4AZ1CP0J", 
   @year = "2018",

   @engine = :ev, 
   @make = "NISSAN", 
   @model = "Leaf", 
   @plate_type = nil, 
   @registration_date = nil, 
   @vin = "1N4AZ1CP0J", 
   @year = "2018",
    ...]