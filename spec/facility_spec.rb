require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "#vehicle registration" do
  
    it "lists registered vehicles" do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])
        
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it "collects fees" do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)

      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it "assigns plate type" do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      
      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it "cannot complete registration if not offered at facility" do
      @facility_2.register_vehicle(@bolt)

      expect(@facility_2.registered_vehicles).to eq([])
    end
  end

  describe "#written test" do
    it "provides test only if service available" do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)

      @facility_1.add_service("Written Test")
      @registrant_2.earn_permit
      expect(@facility_2.administer_written_test(@registrant_1)).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
    end

    it "only tests registrants with permit and over 16" do
      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)

      @registrant_2.earn_permit
      @registrant_3.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
    end

    it "updates license data" do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end

  describe "#road test" do
    it "provides test only if service available" do
      # expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)

      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.add_service("Road Test")
      expect(@facility_2.administer_road_test(@registrant_1)).to eq(false)
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
    end
      
    it "registrants must've passed written test" do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)

      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
    end

    it "updates license data" do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe "#renew license" do
    it "can renew only if service available" do
      # expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)

      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @facility_1.add_service("Renew License")
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      expect(@facility_2.renew_drivers_license(@registrant_1)).to eq(false)
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
    end

    it "must pass road test to renew" do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @facility_1.add_service("Renew License")
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)

      @facility_1.administer_road_test(@registrant_1)
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
    end

    it "updates license data" do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @facility_1.add_service("Renew License")
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)

      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end
end
