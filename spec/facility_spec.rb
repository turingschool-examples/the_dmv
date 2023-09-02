require 'spec_helper'
require './lib/registrant'

RSpec.describe Facility do
  
  describe '#Vehicle Registration' do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
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

  describe '#add service' do
    it 'can add more than one available service' do
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  it 'checks pre-registration which should return NIL' do
    @facility_1.add_service('Vehicle Registration')
    expect(@cruz.registration_date).to eq(nil)
  end

  it 'returns initial list of registered vehicles from facility 1 and no collected fees' do
    @facility_1.add_service('Vehicle Registration')
    expect(@facility_1.registered_vehicles).to eq([])
    expect(@facility_1.collected_fees).to eq(0)
  end

  it 'checks the plate type and updates collected fees' do
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(@cruz)
    expect(@cruz.plate_type).to be(:regular)
    expect(@facility_1.collected_fees).to be(100)
  end

  it 'can register a second vehicle of camaro and due to its year date return an antique' do
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(@camaro)
    expect(@camaro.plate_type).to be(:antique)
  end

  it 'can register a third vehicle of bolt and due to its year date return an ev' do
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(@bolt)
    expect(@bolt.plate_type).to be(:ev)
  end

  it 'updates list of facility registered vehicles and updates collected fees' do
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(@cruz)
    @facility_1.register_vehicle(@camaro)
    @facility_1.register_vehicle(@bolt)
    expect(@facility_1.registered_vehicles.count).to eq(3)
    expect(@facility_1.collected_fees).to be(325)
  end

  it 'checks that facility 2 has no registered vehicles or services' do
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.services).to eq([])
  end

  it 'makes sure that vehicle cannot be re-registered after initial registration in vehicle 1' do
    @facility_2.register_vehicle(@bolt)
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.collected_fees).to eq(0)
  end
  end

  describe '#Written Test' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 16)
      @registrant_3 = Registrant.new('Tucker', 15)
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end 
  
    it 'collects license data of registrant 1' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'verifying that the written test has not yet been administered' do
      expect(@registrant_1.permit?).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq("Sorry, this location does not service written tests.")
    end
  
    it 'returns a hash that contains the proper license data' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  
    it 'administers a written test after the service is added to the facility and changes the status of written test per registrant' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'returns current status of no permit for registrant 2' do
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)
    end

    it 'returns current status of no permit for registrant 2' do
      @registrant_2.earn_permit
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.permit?).to eq(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'checks the age of registrant 3 and their permit status of false' do
      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
    end

    it 'gives registrant 3 their permit, but cannot offer written due to age' do
      @registrant_3.earn_permit
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.permit?).to eq(true)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    end

  describe '#Road Test' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 16)
      @registrant_3 = Registrant.new('Tucker', 15)
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

  it 'verifies that registrant 3 can receive a permit but cannot have road test due to 16 year old requirement and written test' do
    @registrant_3.earn_permit
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Written Test')
    @facility_1.administer_road_test(@registrant_3)
    expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it 'adds multiple services to facility 1' do
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    expect(@facility_1.services).to eq(["Written Test", "Road Test"])
  end

  it 'after administering the road test, registrant 1 has a license' do

    @facility_1.add_service('Written Test')
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.add_service('Road Test')
    @facility_1.administer_road_test(@registrant_1)
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
  end

  it 'checking that Registrant 2 can also get a license' do
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @registrant_2.earn_permit
    @facility_1.administer_written_test(@registrant_2)
    @facility_1.administer_road_test(@registrant_2)
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
  end

  it 'can add new service of Renewing Licenses to Facility 1' do
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Renew License')
    expect(@facility_1.services).to eq(["Written Test", "Road Test", "Renew License"])
  end

  it 'will renew Registrant 1 for a license' do
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Renew License')
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.administer_road_test(@registrant_1)
    @facility_1.renew_drivers_license(@registrant_1)
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
  end

  it 'will not renew Registrant 3 for a license since they have not received a license before' do
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Renew License')
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.administer_road_test(@registrant_1)
    @facility_1.renew_drivers_license(@registrant_1)
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
  end

  it 'will renew Registrant 2 for a license' do
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Renew License')
    @registrant_2.earn_permit
    @facility_1.administer_written_test(@registrant_2)
    @facility_1.administer_road_test(@registrant_2)
    @facility_1.renew_drivers_license(@registrant_2)
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
  end
end

end

