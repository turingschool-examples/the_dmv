require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 't1 can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 't2 can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "i2.a facility can handle a car" do
    it "t4 vehicles can recieve plate time stamped" do
      expect(@facility_1.add_service("Vehicle Registration")).to eq(["Vehicle Registration"])
      expect(@cruz.registration_date).to be(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
    end

    it "t5 can store registered vehicals" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
    
    it "t6 can collect fees" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe "i2.a facility can handle multiple cars" do
    
    it "t7 can give vehicles different plates" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end
    
    it "t8 can collect and get a sum of fees" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe "i2.a facilities cannot offer services they don't have" do
    it "t9 not allow a facility to register a vehicle unless it has that service" do
      @facility_1.register_vehicle(@bolt)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
    
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe "i2.b facilities can give tests to registrants" do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
    end
    describe "Written test" do
      it "t10 cannot administer tests without offering said service" do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.permit?).to be true
        expect(@facility_1.administer_written_test(@registrant_1)).to be false
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it "t11 can administer tests if offering said service" do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@facility_1.add_service('Written Test')).to eq(["Written Test"])
        expect(@facility_1.administer_written_test(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it "t12 will not give written test to registrant without permit" do
        @facility_1.add_service('Written Test')
        expect(@registrant_2.age).to eq(16)
        expect(@registrant_2.permit?).to eq(false)

        expect(@facility_1.administer_written_test(registrant_2)).to be false
        @registrant_2.earn_permit
        expect(@facility_1.administer_written_test(registrant_2)).to be true

        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it "t13 will not give test to people under 16" do
        @facility_1.add_service('Written Test')
        expect(@registrant_3.age).to eq(15)
        expect(@registrant_3.permit?).to eq(false)

        expect(@facility_1.administer_written_test(@registrant_2)).to be false
        @registrant_3.earn_permit

        expect(@facility_1.administer_written_test(@registrant_2)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    end

    describe "Road test" do
      it "t14 will not give the Road Test to registrant on permit without service" do
        @facility_1.add_service('Written Test')

        expect(@facility_1.administer_road_test(@registrant_3)).to be false

        @registrant_3.earn_permit

        expect(@facility_1.administer_road_test(@registrant_3)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it "t15 will administer a Road Test if has the service and registrant has completed the written test" do
        @facility_1.add_service('Written Test')
        
        expect(@facility_1.administer_road_test(@registrant_1)).to be false

        expect(@facility_1.add_service("Road Test")).to eq(["Written Test", "Road Test"])
        expect(@facility_1.administer_road_test(@registrant_1)).to be true

        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
        
        expect(@facility_1.administer_road_test(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end
    end

    describle "Renew License" do
      it "t16 can only renew license if it has said service" do
        @facility_1.add_service("Written Test")
        @facility_1.add_service("Road Test")

        expect(@facility_1.renew_drivers_license(registrant_1)).to be false

        expect(@facility_1.add_service('Renew License')).to eq(["Written Test", "Road Test", "Renew License"])
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end

      it "t17 cannot renew driver who have not passed the road test" do
        @facility_1.add_service("Written Test")
        @facility_1.add_service("Road Test")
        @facility_1.add_service("Renew License")

        expect(@facility_1.renew_drivers_license(@registrant_1)).to be false
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

        expect(@facility_1.renew_drivers_license(@registrant_2)).to be false
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end
    end
  end
end
