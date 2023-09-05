require 'spec_helper'

RSpec.describe Facility do
  
  describe '#initialize' do
    it 'can initialize' do
      @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})      
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})      
      expect(@facility.services).to eq([])      
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')      
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle' do
    before(:each) do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )  
      @facility_1.add_service('Vehicle Registration')
    end

    it 'registers vehicle' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)    
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today.year)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'registers more vehicles' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today.year)
      expect(@camaro.plate_type).to eq(:antique)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today.year)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end

    it 'collects fees for each registered vehicle' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'will not register vehicle if no services offered' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end    
  end
  
  describe '#license_data' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

    describe '#administer_written_test' do
      it 'does not administer written test if service not provided' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.permit?).to be_truthy
        @facility_1.administer_written_test(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'administers written test if service provided' do
        @facility_1.add_service('Written Test')
        @facility_1.administer_written_test(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'will not administer written test if registrant does not have permit' do
        @facility_1.add_service('Written Test')
        expect(@registrant_2.age).to eq(16)
        expect(@registrant_2.permit?).to eq(false)       
        @facility_1.administer_written_test(@registrant_2)
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_2.permit?).to eq(false)
      end

      it 'administers written test once registrant receives permit' do
        @facility_1.add_service('Written Test')
        @registrant_2.earn_permit
        @facility_1.administer_written_test(@registrant_2)
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'will not administer written test to underage registrant' do
        @facility_1.add_service('Written Test')
        @registrant_3.earn_permit
        expect(@registrant_3.age).to eq(15)
        @facility_1.administer_written_test(@registrant_3)
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})   
      end   
    end

    describe '#administer_road_test' do
      it 'will not administer road test by default' do
        @facility_1.administer_road_test(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'will adminster road test if service allowed' do
        @facility_1.add_service('Written Test')
        @facility_1.add_service('Road Test')
        @facility_1.administer_written_test(@registrant_1)
        @facility_1.administer_road_test(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end
    end

    describe "#renew_drivers_license" do
      before(:each) do
        @facility_1.add_service('Written Test')
        @facility_1.add_service('Road Test')
        @facility_1.administer_written_test(@registrant_1)
        @facility_1.administer_road_test(@registrant_1)
      end

      it "does not provide license renewal by default" do
        @facility_1.renew_drivers_license(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end

      it "does not renew license if registrant does not hold license" do
        @registrant_2.earn_permit
        @facility_1.administer_written_test(@registrant_2)
        @facility_1.renew_drivers_license(@registrant_2)
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it "renews license if service is offered" do
        @facility_1.add_service('Renew License')
        @facility_1.renew_drivers_license(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end
    end
  end
end
