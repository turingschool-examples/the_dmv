require 'spec_helper'

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
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
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

  describe '#register_ev' do
    it 'can assign plate type to :ev' do
      expect(@bolt.plate_type).to be nil
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_ev(@bolt)

      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'can collect $200 in registration fees' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_ev(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'adds registered vehicle to registered_vehicles array' do
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@bolt])
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'will not function if service is unavailable' do
      expect(@bolt.plate_type).to be nil
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_ev(@bolt)

      expect(@bolt.plate_type).to be nil
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_antique' do
    it 'can assign plate type to :antique' do
      expect(@camaro.plate_type).to be nil

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_antique(@camaro)

      expect(@camaro.plate_type).to eq(:antique)
    end

    it 'can collect $25 in registration fees' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_antique(@camaro)

      expect(@facility_1.collected_fees).to eq(25)
    end

    it 'adds registered vehicle to registered_vehicles array' do
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.registered_vehicles).to eq([@camaro])
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'will not function if service is unavailable' do
      expect(@camaro.plate_type).to be nil
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_antique(@camaro)

      expect(@camaro.plate_type).to be nil
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_reg' do
    it 'can assign plate type to :regular' do
      expect(@cruz.plate_type).to be nil

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_reg(@cruz)

      expect(@cruz.plate_type).to eq(:regular)
    end

    it 'can collect $100 in registration fees' do
      expect(@facility_1.collected_fees).to eq(0)
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_reg(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'adds registered vehicle to registered_vehicles array' do
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'will not function if service is unavailable' do
      expect(@cruz.plate_type).to be nil
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_reg(@cruz)

      expect(@cruz.plate_type).to be nil
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do
    it 'sets the registration date for the vehicle if service is available' do
      expect(@cruz.registration_date).to be nil

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to be_an_instance_of(Date)
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'will not register if service is unavailable' do
      expect(@cruz.registration_date).to be nil

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to be nil
    end

    it 'assigns plate type :regular to non-ev cars that are less than 25yrs old' do
      expect(@cruz.plate_type).to be nil

      @facility_1.add_service('Vehicle Registration')      
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq(:regular)
    end

    it 'assigns plate type :antique to non-ev vehicles older than 25yrs old' do
      expect(@camaro.plate_type).to be nil

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@camaro.plate_type).to eq(:antique)
    end

    it 'assigns plate type :ev to ev vehicles' do
      expect(@bolt.plate_type).to be nil
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'adds registered vehicle to registered_vehicles array' do
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'collects $100 in fees for :regular plates' do
      expect(@facility_1.collected_fees).to eq(0)
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'collects $25 in fees for :antique plates' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'collects $200 in fees for :ev plates' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#administer_written_test' do
    it 'completes written portion of license test if service is available' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'will do nothing if service is unavailable' do 
      @facility_1.administer_written_test(@registrant_1)

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'will do nothing if registrant is less than 16 years old' do
      @facility_1.add_service('Written Test')
      @registrant_3.earn_permit
      @facility_1.administer_written_test(@registrant_3)

      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'will still function if the registrant is exactly 16 years old' do
      @facility_1.add_service('Written Test')
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'will only function if registrant has a permit' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#administer_road_test' do
    it 'gives registrant license if service is available and registrant passed written test' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

    it 'will do nothing if service is unavailable at the facility' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'will do nothing if registrant has not passed written test' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_1)

      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#renew_drivers_license' do
    it 'renews drivers license if registrant has already earned one' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)

      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end

    it 'will do nothing if service is unavailable' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)

      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

    it 'will do nothing if registrant has not earned their license' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Renew License')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)

      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end
end