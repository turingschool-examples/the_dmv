require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
      expect(@facility.collected_fees).to eq 0 
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle' do
    before(:each) do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end

    it 'cannot register a vehicle if the service is not present at the facility' do
      expect(@facility.services).to eq []
      expect(@facility.register_vehicle(@cruz)). to eq nil
    end

    it 'can register a vehicle' do
      @facility.add_service('Vehicle Registration')

      @facility.register_vehicle(@cruz)

      expect(@facility.registered_vehicles).to eq [@cruz]

      @facility.register_vehicle(@bolt)

      expect(@facility.registered_vehicles).to eq [@cruz, @bolt]
    end

    it 'can collect a fee when registering a vehicle' do
      @facility.add_service('Vehicle Registration')
      
      @facility.register_vehicle(@cruz)
      
      expect(@facility.collected_fees).to eq 100
    end

    it 'can assigns the proper plate when registering a vehicle' do
      @facility.add_service('Vehicle Registration')

      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)
      @facility.register_vehicle(@camaro)

      expect(@cruz.plate_type).to eq :regular
      expect(@bolt.plate_type).to eq :ev
      expect(@camaro.plate_type).to eq :antique
    end
  end 

  describe '#collect_fee' do
    before(:each) do
      @facility.add_service('Vehicle Registration')
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end

    it 'can collect a fee (regular)' do
      @facility.collect_fee(@cruz)

      expect(@facility.collected_fees).to eq 100
    end

    it 'can collect a fee (ev)' do
      @facility.collect_fee(@bolt)

      expect(@facility.collected_fees).to eq 200
    end
    
    it 'can collect a fee (antique)' do
      @facility.collect_fee(@camaro)
      
      expect(@facility.collected_fees).to eq 25
    end

    it 'can accumulate collected_fees' do
      @facility.collect_fee(@cruz)

      expect(@facility.collected_fees).to eq 100

      @facility.collect_fee(@bolt)

      expect(@facility.collected_fees).to eq 300

      @facility.collect_fee(@camaro)

      expect(@facility.collected_fees).to eq 325
    end
  end 

  describe '#administer_written_test' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 16)
      @registrant_3 = Registrant.new('Tucker', 15)
    end

    it 'cannot administer a written test if the service is not present at facility' do
      expect(@facility.administer_written_test(@registrant_1)).to eq nil
      expect(@registrant_1.license_data).to eq ({written: false, license: false, renewed: false})
    end

    it 'cannot administer a written test if the registrant does not have a permit' do
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      @facility.administer_written_test(@registrant_2)

      expect(@registrant_1.license_data).to eq ({:written=>true, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
    end

    it 'cannot administer a written test if the registrant is younger than 16' do
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_3)

      expect(@registrant_3.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can administer a written test and it changes the registrants license data' do
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)

      expect(@facility.administer_written_test(@registrant_1)).to eq true
      expect(@registrant_1.license_data).to eq ({:written=>true, :license=>false, :renewed=>false})

      @registrant_2.earn_permit
      @facility.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data[:written]).to eq true
    end
  end
end
