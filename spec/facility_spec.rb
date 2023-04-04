require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
    end

    it 'has readable attributes' do 
      expect(@facility_1.name).to eq('Albany DMV Office')
      expect(@facility_1.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility_1.phone).to eq('541-967-2014')
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#add_service' do
    it 'can add services to a facility' do
      expect(@facility_1.services).to eq([])
      expect(@facility_1.add_service('New Drivers License')).to eq(['New Drivers License'])
      expect(@facility_1.add_service('Renew Drivers License')).to eq(['New Drivers License', 'Renew Drivers License'])
      expect(@facility_1.add_service('Vehicle Registration')).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end
  
  describe '#register_vehicle' do
    before(:each) do
      @facility_1.add_service('Vehicle Registration')
    end

    it 'has added Vehicle Registration as a service' do 
      expect(@facility_1.services).to eq(['Vehicle Registration'])
    end

    it 'checks the current registration date on the vehicle' do 
      expect(@cruz.registration_date).to eq(nil)
    end

    it 'retrieves a list of registered vehicles' do 
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'checks the total amount of collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it '#register_vehicle(vehicle)' do 
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
    end

    it 'documents the date of registration' do
      expect(@cruz.registration_date).to eq(nil)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'assigns a plate type' do
      expect(@cruz.plate_type).to eq(:regular)
    end

    it 'adds to the list of registered vehicles' do
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'adds to the total collected fees' do 
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @camaro])
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro,@bolt])
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro,@bolt])
      expect(@facility_1.collected_fees).to eq(325)
    end
  
    it 'checks for registered vehicles at other facilities' do
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'checks for services at other facilities' do
      expect(@facility_2.services).to eq([])
    end

    it 'does not offer Vehicle Registration as a service at all facilities' do 
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
    end

    it 'A facility can have no registered vehicles or zero collected fees' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe  '#administer_written_test(registrant)' do
    before(:each) do 
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
    end

    describe 'administers a written test for registrants with a permit and older than 15' do
      it 'checks license data' do 
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'checks permit status' do 
        expect(@registrant_1.permit?).to be(true)
      end

      it "the facility has to offer the provided service" do 
        expect(@facility_1.administer_written_test(@registrant_1)).to be(false)
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'aadministers written test when a service is offered and registrant conditions are met' do 
        expect(@facility_1.add_service('Written Test')).to eq(['Written Test'])
        expect(@facility_1.administer_written_test(@registrant_1)).to be(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end
    end
  
  
    describe 'does not administer written test to all registrants' do
      before(:each) do
        @facility_1.add_service('Written Test')
      end

        it 'checks registrants age' do 
        expect(@registrant_2.age).to eq(16)
        end

        it 'checks registrant permit status' do 
        expect(@registrant_2.permit?).to be(false)
        end

        it 'cannot administer test to registrant with no permit' do 
        expect(@facility_1.administer_written_test(@registrant_2)).to be(false)
        end

        it 'can administer a written test to a registrant that has recently earned their permit and is older than 15' do 
          expect(@registrant_2.permit?).to be(false)
          @registrant_2.earn_permit
          expect(@facility_1.administer_written_test(@registrant_2)).to be(true)
          expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        end
    end
  

    describe 'administers a written test for registrant 3' do 
      it 'checks the age' do 
      expect(@registrant_3.age).to eq(15)
      end

      it 'checks registrant permit status' do 
      expect(@registrant_3.permit?).to be(false)
      end

      it 'cannot administer test to registrant with no permit or if underage ' do 
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
      end

      it 'can only administer written test to permit holders older than 15' do
        expect(@registrant_3.permit?).to be(false)
        @registrant_3.earn_permit
        expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    end
  end

  describe '#administer_road_test(registrant)' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
    end

    describe 'must offer Road Test as a provided service' do
      it 'does not offer road tests as a service for permit-holding registrants' do 
          expect(@facility_1.administer_road_test(@registrant_3)).to be(false)
          @registrant_3.earn_permit
          expect(@facility_1.administer_road_test(@registrant_3)).to be(false)
          expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    

      it 'does not offer road tests as a service to registrants with a passing written test' do
        expect(@facility_1.administer_road_test(@registrant_1)).to be(false)
      end

      it 'adds road test as a provided service' do 
        expect(@facility_1.add_service('Road Test')).to eq(["Written Test", "Road Test"])
      end
    end
  

    describe 'administered road test' do
      before(:each) do
        @facility_1.add_service('Road Test')
      end

      it 'administers road test for registrants with a passing written test' do 
      expect(@facility_1.administer_road_test(@registrant_1)).to be(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end

      it 'updates the license data after administering a road test' do
        expect(@facility_1.administer_road_test(@registrant_2)).to be(true)
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end
    end
  end

  describe '#renew_drivers_license(registrant)' do
    before (:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)
    end


      it 'must offer license renewal as a provided service' do
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be(false)
      end
    
   
      it 'adds license renewal service ' do
        expect(@facility_1.add_service('Renew License')).to eq(['Written Test', 'Road Test', 'Renew License'])
      end
   

    describe 'only allows license renewal if registrant conditions are also met' do
      before(:each) do
        @facility_1.add_service('Renew License')
      end

      it 'renews the license of a registrant with a current license' do
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be(true)
        expect(@registrant_1.license_data).to eq({:license=>true, :renewed=>true, :written=>true})
      end

      it 'does not renew a license if a registrant does have license' do
        expect(@facility_1.renew_drivers_license(@registrant_3)).to be(false)
        expect(@registrant_3.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
      end

      it 'renews the license of a registrant that has passed the road test' do
        expect(@facility_1.renew_drivers_license(@registrant_2)).to be(true)
        expect(@registrant_2.license_data).to eq({:license=>true, :renewed=>true, :written=>true})
      end
    end 
  end
end