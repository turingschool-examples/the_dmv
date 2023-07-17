require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    #have @facility because I did not want to modify original tests
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
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
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add_service' do  
    it 'can add available service' do
      expect(@facility.services).to eq([])
      @facility.add_service("Vehicle Registration")

      expect(@facility.services).to eq(["Vehicle Registration"])
    end

    it 'can add multiple available services' do
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')

      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end
  
  describe '#register_vehicle' do 
    it "has no registered vehicles" do 
     expect(@facility_1.registered_vehicles).to eq([])
    end

    it "adds vehicle to registered vehicles" do
      @facility_1.add_service("Vehicle Registration")
      
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
    
    it "sets registration date of vehicle registered" do 
      @facility_1.add_service("Vehicle Registration")
      expect(@cruz.registration_date).to eq nil
      
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end
    
    it "will not register vehicle unless service offered at facility" do 
      @facility_2.register_vehicle(@bolt)
      
      expect(@facility_2.services).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@bolt.registration_date).to eq(nil)
    end
    
    it "has set_plate_type method" do 
      @facility_1.set_plate_type(@cruz)
      
      expect(@cruz.plate_type).to eq(:regular)
    end
    
    it "has collect_fees method" do 
      @facility.collect_fees(@cruz)
      
      expect(@facility.collected_fees).to eq(100)
    end
  end 
  
  describe "#set_plate_type" do 
    it "sets plate type upon registration" do 
      @facility_1.add_service("Vehicle Registration")
      
      expect(@cruz.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)
      
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      
      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end 
  end

  describe "#collect_fees" do   
    it "adds fees to collected_fees array based on vehicle type" do
      @facility_1.add_service("Vehicle Registration")
      expect(@facility_1.collected_fees).to eq(0)
      
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(125)
      
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end

    it "will not collect fees unless registration service if offered at facility" do 
      expect(@facility_2.services).to eq([])

      @facility_2.register_vehicle(@bolt)
      
      expect(@facility_2.collected_fees).to eq(0)
    end 
  end

  describe "#administer_written_test" do 
    it "can only administer if written test provided by facility" do
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it "can only administer written test if registrant has a permit" do
      @facility_1.add_service('Written Test')
      
      expect(@registrant_2.permit?).to eq(false)
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    
    it "can only administer written test to registrants 16 or older" do 
      @facility_1.add_service('Written Test')
      
      expect(@registrant_3.age).to eq(15)
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
  
  describe "#administer_road_test" do 
    it "can only administer if Road test provided by facility" do 
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data[:written]).to eq(true)
      
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq(false)
      
      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq(true)
    end
    
    it "can administer only to registrants who have taken the written test" do 
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_1.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data[:written]).to eq(true)
      
      @facility_1.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data[:license]).to eq(true)    
    end
  end

  describe "#renew_drivers_license" do 
    it "can only administer if renewal is offered by facility" do 
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)
      
      expect(@registrant_1.license_data[:written]).to eq(true)
      expect(@registrant_1.license_data[:license]).to eq(true)
      expect(@registrant_1.license_data[:renewed]).to eq(false)
      
      @facility_1.add_service('Renew License')
      @facility_1.renew_drivers_license(@registrant_1)
      
      expect(@registrant_1.license_data[:renewed]).to eq(true)
    end
    
    it "can only renew license to registrants who have previously earned a license" do 
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')

      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.renew_drivers_license(@registrant_2)
      expect(@registrant_2.license_data[:renewed]).to eq(false)

      @facility_1.administer_road_test(@registrant_2)
      @facility_1.renew_drivers_license(@registrant_2)
      expect(@registrant_2.license_data[:renewed]).to eq(true)
    end
  end
end
