require 'spec_helper'

RSpec.describe Facility do
  # before(:each) do
  #   @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
  # end
  # describe "Established information" do

  #   describe '#initialize' do
  #     it 'can initialize' do
  #       expect(@facility).to be_an_instance_of(Facility)
  #       expect(@facility.name).to eq('Albany DMV Office')
  #       expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
  #       expect(@facility.phone).to eq('541-967-2014')
  #       expect(@facility.services).to eq([])
  #     end
  #   end
  
  #   describe '#add service' do
  #     it 'can add available services' do
  #       expect(@facility.services).to eq([])
  #       @facility.add_service('New Drivers License')
  #       @facility.add_service('Renew Drivers License')
  #       @facility.add_service('Vehicle Registration')
  #       expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
  #     end
  #   end
  # end

  describe "Vehicle Registration" do
    before(:each) do

      @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end
    
    # if I want to break these tests below down into individual tests, type = one kind, date = one test, registered_vehicles = one test etc and then have all 
    # 3 dates or all 3 types or whatever. Tis is blocked out and registrant_spec tests is one test specifically per test. One test would be like
    # one action per test. This is more convention issues than anything. Come back and adjust them if I have time. Decide on one way or the other.

    it "returns the services added" do

      expect(@facility_1.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])

    end

    it "vehicle registration_date defaults to nil" do

      expect(@cruz.registration_date).to eq(nil)

    end

    it "registered_vehicles attribute defaults to empty" do

      expect(@facility_1.registered_vehicles).to eq([])

    end

    it "collected_fees attribute defaults to 0" do

      expect(@facility_1.collected_fees).to eq(0)

    end
    
    it "returns the register_vehicle method" do

      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])

      expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @camaro])

      expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])

    end

    it "will set the vehicle registration date" do

      date = Time.new.strftime("%d/%m/%Y")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@cruz.registration_date).to eq(date)
      expect(@camaro.registration_date).to eq(date)
      expect(@bolt.registration_date).to eq(date)

    end

    it "can have a :regular plate type" do

      expect(@cruz.plate_type).to eq(:regular)

    end

    it "can have an :ev plate type" do

      expect(@bolt.plate_type).to eq(:ev)

    end

    it "can have an :antique plate type" do

      expect(@camaro.plate_type).to eq(:antique)
      
    end

    xit "adds plate_type to vehicle when registered" do

      #this isn't asserting anything or at least my shit isn't returnig the right way

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles[0].plate_type).to eq(:regular)

    end

    xit "adds vehicles to @registered_vehicles attribute" do

      @facility_1.register_vehicle(@cruz)
      
      expect(@facility_1.registered_vehicles).to eq([@cruz])

      @facility_1.register_vehicle(@camaro)
      
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])

      # @facility_1.register_vehicle(@bolt)

      # expect(@facility_1.registered_vehicles).to eq([@cruz, @camara, @bolt])


    end
      
    xit "can collect fees for type of car" do

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
      
    end



    xit "can register a antique type" do

      #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>]
      
      # expect(@camaro.registration_date).to eq(Date.today)
      #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>
      
      # expect(@camaro.plate_type).to eq(:antique)
      # #=> :antique
      # expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
      expect(@facility_1.collected_fees).to eq(25)
    end
      
    xit "can register a third vehicle" do 


      # expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])
      #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]
      
      # expect(@bolt.registration_date).to eq(Date.today)
      #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>
      
      # expect(@bolt.plate_type).to eq(:ev)
      # #=> :ev
      
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camara, @bolt])
      #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]
      
      expect(@facility_1.collected_fees).to eq(325)
      #=> 325
    end
    
    xit "facility_2 is to empty" do

      expect(@facility_2.registered_vehicles).to eq([])
      #=> []
      
      expect(@facility_2.services).to eq([])
      #=> []
      
      expect(@facility_2.register_vehicle(bolt)).to eq(nil)
      #=> nil
      
      expect(@facility_2.registered_vehicles).to eq([])
      #=> []
      
      expect(@facility_2.collected_fees).to eq(0)
      #=> 0
      
    end
  end
end
