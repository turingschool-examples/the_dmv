require 'spec_helper.rb'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  # Write a test to show vehicles get registered via #register_vehicle method.
  # Show before/after status with faciilty_1.registered_vehicles changing to 
  #  store vehicles as they are processed.
  # 
  describe '#register_vehicle' do
    it 'shows array of registered vehicles' do
      
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])

      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])

      @facility_2.collected_fees
      expect(@facility_2.collected_fees).to eq(0)

    end

    it 'added $25 to @collected_fees for antique vehicle' do
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)

    end

    it 'added $200 to @collected_fees for EVs' do
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'added $100 to @collected_fees for any vehicle not antique/not EV' do
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'assigns plate type to the vehicle' do
      expect(@cruz.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)

      @facility_1.add_service('Vehicle Registration') # We're adding the service so we can register the vehicle

      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'applies a timestamp' do

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@cruz.registration_date).to eq(Date.today)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@bolt.registration_date).to eq(Date.today)

    end
  end



end




# pry(main)> require './lib/registrant'
# #=> true

# pry(main)> require './lib/facility'
# #=> true

# pry(main)> registrant_1 = Registrant.new('Bruce', 18, true )
# #=> #<Registrant:0x000000012d863e80 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

# pry(main)> registrant_2 = Registrant.new('Penny', 16 )
# #=> #<Registrant:0x000000012d94ba78 @age=16, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

# pry(main)> registrant_3 = Registrant.new('Tucker', 15 )
# #=> #<Registrant:0x000000012d8b0e38 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Tucker", @permit=false>

# pry(main)> facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
# #=> #<Facility:0x000000010e5ad5e8 @address="2855 Tremont Place Suite 118 Denver CO 80205", @name="DMV Tremont Branch", @phone="(720) 865-4600", @services=[]>

# pry(main)> facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
# #=> #<Facility:0x000000010e5ad480 @address="4685 Peoria Street Suite 101 Denver CO 80239", @name="DMV Northeast Branch", @phone="(720) 865-4600", @services=[]>

# #Written Test

# pry(main)> registrant_1.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# pry(main)> registrant_1.permit?
# #=> true

# pry(main)> facility_1.administer_written_test(registrant_1)
# #=> false

# pry(main)> registrant_1.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# pry(main)> facility_1.add_service('Written Test')
# #=> ["Written Test"]

# pry(main)> facility_1.administer_written_test(registrant_1)
# #=> true

# pry(main)> registrant_1.license_data
# #=> {:written=>true, :license=>false, :renewed=>false}

# pry(main)> registrant_2.age
# #=> 16

# pry(main)> registrant_2.permit?
# #=> false

# pry(main)> facility_1.administer_written_test(registrant_2)
# #=> false

# pry(main)> registrant_2.earn_permit

# pry(main)> facility_1.administer_written_test(registrant_2)
# #=> true

# pry(main)> registrant_2.license_data
# #=> {:written=>true, :license=>false, :renewed=>false}

# pry(main)> registrant_3.age
# #=> 15

# pry(main)> registrant_3.permit?
# #=> false

# pry(main)> facility_1.administer_written_test(registrant_3)
# #=> false

# pry(main)> registrant_3.earn_permit

# pry(main)> facility_1.administer_written_test(registrant_3)
# #=> false

# pry(main)> registrant_3.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# # Road Test

# pry(main)> facility_1.administer_road_test(registrant_3)
# #=> false

# pry(main)> registrant_3.earn_permit

# pry(main)> facility_1.administer_road_test(registrant_3)
# #=> false

# pry(main)> registrant_3.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# pry(main)> facility_1.administer_road_test(registrant_1)
# #=> false

# pry(main)> facility_1.add_service('Road Test')
# #=> ["Written Test", "Road Test"]

# pry(main)> facility_1.administer_road_test(registrant_1)
# #=> true

# pry(main)> registrant_1.license_data
# #=> {:written=>true, :license=>true, :renewed=>false}

# pry(main)> facility_1.administer_road_test(registrant_2)
# #=> true

# pry(main)> registrant_2.license_data
# #=> {:written=>true, :license=>true, :renewed=>false}

# # Renew License

# pry(main)> facility_1.renew_drivers_license(registrant_1)
# #=> false

# pry(main)> facility_1.add_service('Renew License')
# #=> ["Written Test", "Road Test", "Renew License"]

# pry(main)> facility_1.renew_drivers_license(registrant_1)
# #=> true

# pry(main)> registrant_1.license_data
# #=> {:written=>true, :license=>true, :renewed=>true}

# pry(main)> facility_1.renew_drivers_license(registrant_3)
# #=> false

# pry(main)> registrant_3.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# pry(main)> facility_1.renew_drivers_license(registrant_2)
# #=> true

# pry(main)> registrant_2.license_data
# #=> {:written=>true, :license=>true, :renewed=>true}