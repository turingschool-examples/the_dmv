require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new(
                  {name: 'Albany DMV Office', 
                   address: '2242 Santiam Hwy SE Albany OR 97321', 
                   phone: '541-967-2014' })
    
    @facility_2 = Facility.new(
                  {name: 'Ashland DMV Office', 
                   address: '600 Tolman Creek Rd Ashland OR 97520', 
                   phone: '541-776-6092' })

    @cruz = Vehicle.new(
                   {vin: '123456789abcdefgh', 
                    year: 2012, 
                    make: 'Chevrolet', 
                    model: 'Cruz', 
                    engine: :ice} )

    @bolt = Vehicle.new(
                   {vin: '987654321abcdefgh', 
                    year: 2019, 
                    make: 'Chevrolet', 
                    model: 'Bolt', 
                    engine: :ev} )

    @camaro = Vehicle.new(
                     {vin: '1a2b3c4d5e6f', 
                      year: 1969, 
                      make: 'Chevrolet', 
                      model: 'Camaro', 
                      engine: :ice} )  

    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end
  describe '#initialize' do
    it 'can initialize' do

      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('Albany DMV Office')
      expect(@facility_1.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility_1.phone).to eq('541-967-2014')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add_service' do
    it 'can add available services' do

      expect(@facility_1.services).to eq([])

      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['New Drivers License', 
                                          'Renew Drivers License', 
                                          'Vehicle Registration'])
    end
  end

  describe "registering a vehicle" do
    describe "register_vehicle" do
      it "should register vehicles" do
        @facility_1.add_service('Vehicle Registration')

        expect(@facility_1.registered_vehicles).to eq([])
        
        @facility_1.register_vehicle(@cruz)

        expect(@facility_1.registered_vehicles).to eq([@cruz])
      end
    end

    describe "plate_type" do
      it "should set a plate type" do
        @facility_1.add_service('Vehicle Registration')

        expect(@cruz.plate_type).to eq(nil)

        @facility_1.register_vehicle(@cruz)
        expect(@cruz.plate_type).to eq(:regular)
      end
    end

    describe "fees" do
      it "collects fees" do
        @facility_1.add_service('Vehicle Registration')

        expect(@facility_1.collected_fees).to eq(0)

        @facility_1.register_vehicle(@cruz)

        expect(@facility_1.collected_fees).to eq(100)

      end
    end

    it "can register other vehicles" do
      @facility_1.add_service('Vehicle Registration')
      
      @facility_1.register_vehicle(@cruz)

      @facility_1.register_vehicle(@camaro)

      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)

      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.collected_fees).to eq(325)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])

      @facility_2.register_vehicle(@bolt)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe "administer_written_test" do
    it "can administer written tests" do

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      
      expected = {
                :written=>false,
                :license=>false, 
                :renewed=>false}
      expect(@registrant_1.license_data).to eq(expected)
      
      @facility_1.add_service("Written Test")

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      
      expected = {
              :written=>true,
              :license=>false, 
              :renewed=>false
            }

      expect(@registrant_1.license_data).to eq(expected)
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)

      @registrant_2.earn_permit

      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)
      expected = {
        :written=>true,
        :license=>false, 
        :renewed=>false}
      expect(@registrant_2.license_data).to eq(expected)
      
      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)

      @registrant_3.earn_permit

      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      expected = {
        :written=>false,
        :license=>false, 
        :renewed=>false
      }
      expect(@registrant_3.license_data).to eq(expected)
    end
  end

  describe "administer road test" do
    it "can administer road tests" do

      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)

      @registrant_3.earn_permit

      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)
      
      expected_3 = {
                :written=>false, 
                :license=>false, 
                :renewed=>false
              }
      expect(@registrant_3.license_data).to eq(expected_3)

      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)
      
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")

      expect(@facility_1.services).to eq(["Written Test", "Road Test"])

      @facility_1.administer_written_test(@registrant_1)
      
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)

      expected_1 = {
                written: true, 
                license: true, 
                renewed: false
      }
      expect(@registrant_1.license_data).to eq(expected_1)
     
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)

      expect(@facility_1.administer_road_test(@registrant_2)).to eq(true)

      expected_2 = {
         written: true, 
         license: true,
         renewed: false
      }

      expect(@registrant_2.license_data).to eq(expected_2)

    end
  end

              # renew_license
# Make sure to "add" all the services that are returned in the assertion (expect statement)
# Make sure to call all instances with @ first (@registrant_1, @registrant_2, @registrant_3)
# Make sure to add all services earned previously for registrants.
# 

  describe "renew_license" do
    it "can renew drivers license" do

      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")

      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)

      @facility_1.add_service("Renew License")

      expect(@facility_1.services).to eq(["Written Test", "Road Test", "Renew License"])

      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)

      expected_1 = {
                  written: true,
                  license: true,
                  renewed: true
                }
      
      expect(@registrant_1.license_data).to eq(expected_1)
      expect(@facility_1.renew_drivers_license(@registrant_3)).to eq(false)

      expected_3 = {
                  written: false,
                  license: false,
                  renewed: false
                }
      expect(@registrant_3.license_data).to eq(expected_3)

      @registrant_2.earn_permit

      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)
      @facility_1.renew_drivers_license(@registrant_2)

      expect(@facility_1.renew_drivers_license(@registrant_2)).to eq(true)

      expected_2 = {
                  written: true, 
                  license: true, 
                  renewed: true
                }
      expect(@registrant_2.license_data).to eq(expected_2)

    end
  end

end
