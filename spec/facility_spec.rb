require 'spec_helper'

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
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 ) #curious if I need to test these Registrant initialize(s) too. Didn't we already do that in the Registratnt class?
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
  
  describe '#vehicle registration empty until vehicles added' do
    it 'can add service without adding vehicles' do
     @facility_1.add_service('Vehicle Registration')
     expect(@facility_1.services).to eq(["Vehicle Registration"])
     expect(@cruz.registration_date).to eq(nil)
     expect(@facility_1.registered_vehicles).to eq([])
     expect(@facility_1.collected_fees).to eq(0)
    end 
  end

  describe '#register regular vehicle' do
    it 'can register a regular vehicle' do
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'can log a registration date' do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'can log a plate type' do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
    end 

    it 'can collect fees on regular vehicle' do
      @facility_1.register_vehicle(@cruz)
        expect(@facility_1.collected_fees).to eq (100)
    end
  end

  describe '#register antique vehicle' do
    it 'can register an antique vehicle' do
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@camaro])
    end

    it 'can log a registration date' do
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today)
    end

    it 'can log a plate type' do
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
    end 

    it 'can collect fees on an antique vehicle' do
      @facility_1.register_vehicle(@camaro)
        expect(@facility_1.collected_fees).to eq(25)
    end
  end

  describe '#register EV vehicle' do
    it 'can register an EV' do
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles).to eq([@bolt])
    end

    it 'can log a registration date' do
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today)
    end

    it 'can log a plate type' do
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
    end 

    it 'can collect fees on an EV' do
      @facility_1.register_vehicle(@bolt)
        expect(@facility_1.collected_fees).to eq(200)
    end
  end

  describe '#check registered vehicles' do
    it 'can collect fees on an EV' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#check another facility' do
    it 'has no registrations if registration services unavailable' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([@bolt])
      expect(@facility_1.collected_fees).to eq(0)
    end
  end


  #Written Test
  describe '#administer_written_test' do
    it 'can administer a written test' do

      expect(@registrant_1.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to be true

      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to be false
      expect(@registrant_1.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
      
      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(["Written Test"])

      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to be true
      expect(@registrant_1.license_data).to eq ({:written=>true, :license=>false, :renewed=>false})
      
      @registrant_2.age
      expect(@registrant_1.age).to eq(16)
      
      @registrant_2.permit?
      expect(@registrant_1.permit?).to be false

      @facility_1.administer_written_test(@registrant_2)
      expect(@facility_1.administer_written_test(@registrant_2)).to be false
      expect(@registrant_1.license_data).to eq ({:written=>true, :license=>false, :renewed=>false})

      @registrant_3.age
      expect(@registrant_1.age).to eq(15)
      
      @registrant_3.permit?
      expect(@registrant_1.permit?).to be false

      @facility_1.administer_written_test(@registrant_3)
      expect(@facility_1.administer_written_test(@registrant_3)).to be false

      @registrant_3.earn_permit
      @facility_1.administer_written_test(@registrant_3)
      expect(@facility_1.administer_written_test(@registrant_3)).to be false
      expect(@registrant_3.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})

    end
  end

    #Road Test

    describe '#administer_road_test' do
      it 'can administer a road test' do
        @facility_1.administer_road_test(@registrant_3)
        expect(@facility_1.administer_road_test(@registrant_3)).to be false

        @registrant_3.earn_permit
        @facility_1.administer_road_test(@registrant_3)
        expect(@facility_1.administer_road_test(@registrant_3)).to be false

        @registrant_3.license_data
        expect(@registrant_3.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})

        @facility_1.administer_road_test(@registrant_1)
        expect(@facility_1.administer_road_test(@registrant_1)).to be false

        facility_1.add_service('Road Test')
        expect(@facility_1.services).to eq(["Written Test", "Road Test"])

        @facility_1.administer_road_test(@registrant_2)
        expect(@facility_1.administer_road_test(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq ({:written=>true, :license=>true, :renewed=>false})

      end
    end

    # Renew License
    describe '#renew_drivers_license' do
      it 'can renew a drivers license' do
        @facility_1.renew_drivers_license(@registrant_1)
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be false

        @facility_1.add_service('Renew License')
        expect(@facility_1.services).to eq(["Written Test", "Road Test", "Renew License"])

        renew_drivers_license(@registrant_1)
        expect(renew_drivers_license(@registrant_1)).to be true

        expect(@registrant_1.license_data).to eq ({:written=>true, :license=>true, :renewed=>true})

        renew_drivers_license(@registrant_3)
        expect(renew_drivers_license(@registrant_3)).to be false

        @facility_1.renew_drivers_license(@registrant_2)
        expect(@facility_1.renew_drivers_license(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq ({:written=>true, :license=>true, :renewed=>true})

      end
    end
    
end








          #if
            #antique $25 fee
            #EV $200 fee
            #everything else $100 fee

        #it can record a plate_type et to :regular, :antique, or :ev upon successful registration
          #if __ 

      #decribe Administer a written test
        #it can administer to only some
          #permit true
          #age >= 16 

      #describe Administer a road test
        #it can administer to only some
          #passed written test

        #it can give license if road test passed

      #describe renew licence
        #it can renew license
          #if road test == pass && earn license



