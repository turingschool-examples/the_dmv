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

      # @facility_1.add_service('New Drivers License')
      # @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['Vehicle Registration'])  #'New Drivers License', 'Renew Drivers License', 
    end
  end

  # Write a test to show vehicles get registered via #register_vehicle method.
  # Show before/after status with faciilty_1.registered_vehicles changing to 
  #  store vehicles as they are processed.
  # 
  describe '#register_vehicle' do
    it 'shows array of registered vehicles, collects fees, and sets plates' do
      
      @facility_1.add_service("Vehicle Registration")
      expect(@services).to eq["Vehicle Registration"]

      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@faciilty_1.collected_fees).to eq(100)

      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
      expect(@camaro.registration_date).to eq(Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)
      expect(@camaro.plate_type).to eq(:antique)
      
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@bolt.registration_date).to eq(Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@facility_1.collected_fees).to eq(325)

    end

    it 'added $25 to @collected_fees for antique vehicle' do
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)
      expect(@facility_1.collected_fees).to eq(200)
      expect(@facility_1.collected_fees).to eq(100)

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

    # xit 'applies a time stamp' do

    #   @facility_1.register_vehicle(@cruz)

    #   expect(@faciilty_1.registration_date).to eq(Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j))

    # end
  end

end






# pry(main)> require './lib/facility'
# #=> true

# pry(main)> require './lib/vehicle'
# #=> true

# pry(main)> facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
# #=> #<Facility:0x000000010e5ad5e8 @address="2855 Tremont Place Suite 118 Denver CO 80205", @name="DMV Tremont Branch", @phone="(720) 865-4600", @services=[]>

# pry(main)> facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
# #=> #<Facility:0x000000010e5ad480 @address="4685 Peoria Street Suite 101 Denver CO 80239", @name="DMV Northeast Branch", @phone="(720) 865-4600", @services=[]>

# pry(main)> cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
# #=> #<Vehicle:0x0000000135a48b08 @engine=:ice, @make="Chevrolet", @model="Cruz", @plate_type=nil, @registration_date=nil, @vin="123456789abcdefgh", @year=2012>

# pry(main)> bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
# #=> #<Vehicle:0x0000000125832180 @engine=:ev, @make="Chevrolet", @model="Bolt", @plate_type=nil, @registration_date=nil, @vin="987654321abcdefgh", @year=2019>

# pry(main)> camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
# #=> #<Vehicle:0x0000000135adb610 @engine=:ice, @make="Chevrolet", @model="Camaro", @plate_type=nil, @registration_date=nil, @vin="1a2b3c4d5e6f", @year=1969>

# pry(main)> facility_1.add_service('Vehicle Registration')
# #=> ["Vehicle Registration"]

# pry(main)> cruz.registration_date
# #=> nil

# pry(main)> facility_1.registered_vehicles
# #=> []

# pry(main)> facility_1.collected_fees
# #=> 0

# pry(main)> facility_1.register_vehicle(cruz)
# #=> [#<Vehicle:0x0000000135a48b08...>]

# pry(main)> cruz.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

# pry(main)> cruz.plate_type
# #=> :regular

# pry(main)> facility_1.registered_vehicles
# #=> [#<Vehicle:0x0000000135a48b08...>]

# pry(main)> facility_1.collected_fees
# #=> 100

# pry(main)> facility_1.register_vehicle(camaro)
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>]

# pry(main)> camaro.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

# pry(main)> camaro.plate_type
# #=> :antique

# pry(main)> facility_1.register_vehicle(bolt)
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

# pry(main)> bolt.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

# pry(main)> bolt.plate_type
# #=> :ev

# pry(main)> facility_1.registered_vehicles
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

# pry(main)> facility_1.collected_fees
# #=> 325

# pry(main)> facility_2.registered_vehicles
# #=> []

# pry(main)> facility_2.services
# #=> []

# pry(main)> facility_2.register_vehicle(bolt)
# #=> nil

# pry(main)> facility_2.registered_vehicles
# #=> []

# pry(main)> facility_2.collected_fees