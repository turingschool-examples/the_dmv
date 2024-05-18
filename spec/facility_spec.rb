require 'spec_helper'

# pry(main)> require './lib/facility'
# #=> true

# pry(main)> require './lib/vehicle'
# #=> true

# pry(main)> require './lib/registrant'
# #=> true

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Facility do
  before(:each) do

    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end
  
  describe '#initialize' do
  it 'can initialize' do
    
        expect(@facility_1).to be_an_instance_of(Facility)
        expect(@facility_1.name).to eq('DMV Tremont Branch')
        expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
        expect(@facility_1.phone).to eq('(720) 865-4600')
        expect(@facility_1.services).to eq([])
        # pry(main)> facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
        # #=> #<Facility:0x000000010e5ad5e8 @address="2855 Tremont Place Suite 118 Denver CO 80205", @name="DMV Tremont Branch", @phone="(720) 865-4600", @services=[]>
        
        expect(@facility_2).to be_an_instance_of(Facility)
        expect(@facility_2.name).to eq('DMV Northeast Branch')
        expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
        expect(@facility_2.phone).to eq('(720) 865-4600')
        expect(@facility_2.services).to eq([])
        # pry(main)> facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
        # #=> #<Facility:0x000000010e5ad480 @address="4685 Peoria Street Suite 101 Denver CO 80239", @name="DMV Northeast Branch", @phone="(720) 865-4600", @services=[]>
      end

      it "can have a vehicle" do

        expect(@cruz).to be_an_instance_of(Vehicle)
        # pry(main)> cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
        # #=> #<Vehicle:0x0000000135a48b08 @engine=:ice, @make="Chevrolet", @model="Cruz", @plate_type=nil, @registration_date=nil, @vin="123456789abcdefgh", @year=2012>
  
        expect(@bolt).to be_an_instance_of(Vehicle)
        # pry(main)> bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
        # #=> #<Vehicle:0x0000000125832180 @engine=:ev, @make="Chevrolet", @model="Bolt", @plate_type=nil, @registration_date=nil, @vin="987654321abcdefgh", @year=2019>
  
        expect(@camaro).to be_an_instance_of(Vehicle)
        # pry(main)> camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
        # #=> #<Vehicle:0x0000000135adb610 @engine=:ice, @make="Chevrolet", @model="Camaro", @plate_type=nil, @registration_date=nil, @vin="1a2b3c4d5e6f", @year=1969>
      end
    end

    
    describe '#add service' do
      it 'can add available services' do

        expect(@facility_1.services).to eq([])
        @facility_1.add_service('New Drivers License')
        @facility_1.add_service('Renew Drivers License')
        @facility_1.add_service('Vehicle Registration')
        # pry(main)> facility_1.add_service('Vehicle Registration')
        # #=> ["Vehicle Registration"]
        expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
        
        expect(@facility_2.registered_vehicles).to eq([])
        # pry(main)> facility_2.registered_vehicles
        # #=> []
        expect(@facility_2.services).to eq([])
        # pry(main)> facility_2.services
        # #=> []
        expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
        # pry(main)> facility_2.register_vehicle(bolt)
        # #=> nil
      end
    end
    
    describe "#registration_date" do
      it "can assign a registration date" do
        expect(@cruz.registration_date).to eq(nil)
        # pry(main)> cruz.registration_date
        # #=> nil

        @facility_1.add_service('Vehicle Registration')
        
        @facility_1.register_vehicle(@cruz)
        @facility_1.register_vehicle(@camaro)
        @facility_1.register_vehicle(@bolt)
        

        expect(@cruz.registration_date).to eq(Date.today)
        # pry(main)> cruz.registration_date
        # #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>
        
        expect(@camaro.registration_date).to eq(Date.today)
        # pry(main)> camaro.registration_date
        # #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>
        
        expect(@bolt.registration_date).to eq(Date.today)
        # pry(main)> bolt.registration_date
        # #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>
      end
    end
    
    describe "#registered_vehicles" do
      it "can register a vehicle if facility has added service" do
        
        expect(@facility_1.registered_vehicles).to eq([])
        # pry(main)> facility_1.registered_vehicles
        # #=> []
        
        @facility_1.add_service('Vehicle Registration')
        @facility_1.register_vehicle(@cruz)
        
        expect(@facility_1.registered_vehicles).to eq([@cruz])
        # pry(main)> facility_1.registered_vehicles
        # #=> [#<Vehicle:0x0000000135a48b08...>]
        @facility_1.register_vehicle(@camaro)
        
        expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
        # pry(main)> facility_1.register_vehicle(camaro)
        # #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>]
        
        @facility_1.register_vehicle(@bolt)
        
        expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
        # pry(main)> facility_1.register_vehicle(bolt)
        # #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]
        expect(@facility_2.registered_vehicles).to eq([])
        # pry(main)> facility_2.registered_vehicles
        # #=> []
      end
    end
    
    describe "#collected_fees" do
      it "can collect fees from registered vehicles if facility has added service" do
        @facility_1.add_service('Vehicle Registration')

        expect(@facility_1.collected_fees).to eq(0)
        # pry(main)> facility_1.collected_fees
        # #=> 0

        @facility_1.register_vehicle(@cruz)

        expect(@facility_1.collected_fees).to eq(100)
        # pry(main)> facility_1.collected_fees
        # #=> 100
        
        @facility_1.register_vehicle(@bolt)
        
        expect(@facility_1.collected_fees).to eq(300)
        
        @facility_1.register_vehicle(@camaro)
        
        expect(@facility_1.collected_fees).to eq(325)
        # pry(main)> facility_1.collected_fees
        # #=> 325
        
        expect(@facility_2.collected_fees).to eq(0)
        # pry(main)> facility_2.collected_fees
        # #=> 0
      end
    end
    
    describe "#plate_type" do
      it "has a plate type" do
        @facility_1.add_service('Vehicle Registration')
        @facility_1.register_vehicle(@cruz)
        @facility_1.register_vehicle(@bolt)
        @facility_1.register_vehicle(@camaro)
        

        expect(@cruz.plate_type).to eq(:regular)
        # pry(main)> cruz.plate_type
        # #=> :regular
        
        expect(@camaro.plate_type).to eq(:antique)
        # pry(main)> camaro.plate_type
        # #=> :antique
        
        expect(@bolt.plate_type).to eq(:ev)
        # pry(main)> bolt.plate_type
        # #=> :ev
      end
    end

    describe "#written_test" do
      it "can administer a written test to registrant w/permit over 16" do
        expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        # pry(main)> registrant_1.license_data
        # #=> {:written=>false, :license=>false, :renewed=>false}
        
        expect(registrant_1.permit?).to eq(true)
        # pry(main)> registrant_1.permit?
        # #=> true
        
        expect(facility_1.administer_written_test(registrant_1))
        # pry(main)> facility_1.administer_written_test(registrant_1)
        # #=> false
        
        expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        # pry(main)> registrant_1.license_data
        # #=> {:written=>false, :license=>false, :renewed=>false}
        
        expect(facility_1.add_service('Written Test')).to eq(["Written Test"])
        # pry(main)> facility_1.add_service('Written Test')
        # #=> ["Written Test"]
        
        expect(facility_1.administer_written_test(registrant_1)).to eq(true)
        # pry(main)> facility_1.administer_written_test(registrant_1)
        # #=> true
        
        expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        # pry(main)> registrant_1.license_data
        # #=> {:written=>true, :license=>false, :renewed=>false}
      end
    end
  end
  
  


  ##########################
end            
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

##########################

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





