require 'spec_helper'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
    @registrant_1 = Registrant.new('Penny', 16)
    @registrant_2 = Registrant.new('Bruce', 18, true)
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

    it 'has no registered vehicles as default' do
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'has no collected fees as default' do
      expect(@facility_1.collected_fees).to be 0
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

  describe '#register_vehicle' do
    it 'can add vehicle to registered vehicles list' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
      expect(@facility_1.registered_vehicles).to eq([])
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'Assigns plate type and collects corresponding fees' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
      expect(@facility_1.collected_fees).to be 0
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.collected_fees).to be 100
    end

    it 'Assigns multiple plates and collects fees for each' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
      expect(@facility_1.collected_fees).to be 0
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])
      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility_1.collected_fees).to be 325
    end

    it 'Can only register vehicles at a facility that offers the service' do
      expect(@facility_1.services).to eq([])
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to be_nil
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License'])
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to be_nil
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_2.add_service('New Drivers License')
      @facility_2.add_service('Vehicle Registration')
      expect(@facility_2.services).to eq(['New Drivers License', 'Vehicle Registration'])
      @facility_2.register_vehicle(@cruz)
      @facility_2.register_vehicle(@camaro)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_2.registered_vehicles).to eq([@cruz, @camaro])
      expect(@facility_2.collected_fees).to be 125
    end
  end

  describe '#administer_written_test' do
    it 'Sets license data to true once written test administered' do
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'Can only adminster written test at facility that offers the service' do
      expect(@facility_1.services).to eq([])
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License'])
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility_2.add_service('Written Test')
      @facility_2.add_service('Vehicle Registration')
      expect(@facility_2.services).to eq(['Written Test', 'Vehicle Registration'])
      @facility_2.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'Can only adminster written test to someone at least 16 years and has permit' do
      @facility_1.add_service('Written Test')
      expect(@registrant_1.age).to be 16
      expect(@registrant_1.permit?).to be false
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @registrant_1.earn_permit
      expect(@registrant_1.permit?).to be true
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    
    it 'Will not adminster written test to someone under 16 years, even with a permit' do
      @facility_1.add_service('Written Test')
      expect(@registrant_3.age).to be 15
      expect(@registrant_3.permit?).to be false
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @registrant_3.earn_permit
      expect(@registrant_3.permit?).to be true
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'returns false, if written test cannot be administered' do
      expect(@facility_1.administer_written_test(@registrant_1)). to be false
    end
  end

  describe '#administer_road_test' do
    it 'Set license data to true once road test administered, only if passed written test' do
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Written Test')
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_1.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility_1.administer_road_test(@registrant_2)
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      @facility_1.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

    it 'Can only administer road test at facility that offers service, can use multiple facilities' do
      @facility_1.add_service('Road Test')
      @facility_2.add_service('Written Test')
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_2.administer_written_test(@registrant_2)
      @facility_2.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      @facility_1.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

    it 'Can not administer a license to someone too young, under 15' do
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Written Test')
      expect(@registrant_3.age).to be 15
      expect(@registrant_3.permit?).to be false
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @registrant_3.earn_permit
      @facility_1.administer_written_test(@registrant_3)
      @facility_1.administer_road_test(@registrant_3)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'returns false, if road test cannot be administered' do
      expect(@facility_1.administer_road_test(@registrant_1)). to be false
    end
  end

  describe '#renew_drivers_license' do
  it 'Set renewed to true only if has passed license before' do
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Renew License')
    @facility_1.renew_drivers_license(@registrant_2)
    expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

    @facility_1.administer_written_test(@registrant_2)
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

    @facility_1.renew_drivers_license(@registrant_2)
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

    @facility_1.administer_road_test(@registrant_2)
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})

    @facility_1.renew_drivers_license(@registrant_2)
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
  end

    it 'returns false, if road test cannot be administered, true if can be' do
      expect(@facility_1.renew_drivers_license(@registrant_1)). to be false
    end
  end
end
