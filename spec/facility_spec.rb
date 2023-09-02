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
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
      expect(@facility_2.services).to eq([])
    end
  end
  
  describe '#registered_vehicles' do
    it 'adds vehicles registered' do
      expect(@facility_1.registered_vehicles).to eq([])
    end
    
    it 'adds one vehicle' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
    
    it 'adds two vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
    end
    
    it 'adds three vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end
    
    it 'adds a car to facility_2' do
      expect(@facility_2.registered_vehicles).to eq([])
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])
    end
  end
  
  describe '#collected_fees' do
    it 'collect fees for reigstering vehicle' do
      expect(@facility_1.collected_fees).to eq(0)
    end
    
    it 'collect fees for regular car' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end
    
    it 'collect fees for all type cars' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end
  
  describe '#registration_date' do
    it 'shows registration date of cruz' do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end
    
    it 'shows registration date of camaro' do
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today)
    end
    
    it 'shows registeration date of bolt' do
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today)
    end
  end
  
  describe '#plate_type' do
    it 'shows regulatr plate_type' do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
    end
    
    it 'shows antique plate_type' do
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
    end
    
    it 'shows ev plate_type' do
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
    end
  end

  describe '#administer_written_test' do
    it 'administer written test status does not change if not offered' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false}) 
      expect(@registrant_1.permit?).to be true
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false}) 
    end

    it 'administer written test if service is offered' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to be true
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    
    it 'administer written test only if there is permit' do
      @facility_1.add_service('Written Test')
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to be false
      expect(@facility_1.administer_written_test(@registrant_2)).to be false
      @registrant_2.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to be true
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    
    it 'administer written test only for 16 old and up' do
      @facility_1.add_service('Written Test')
      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to be false
      expect(@facility_1.administer_written_test(@registrant_3)).to be false
      @registrant_3.earn_permit
      expect(@facility_1.administer_written_test(@registrant_3)).to be false
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
  
  describe '#road_test' do
    it 'road test status does not change if service is not offered' do
      expect(@facility_1.administer_road_test(@registrant_3)).to be false
      @registrant_3.earn_permit
      expect(@facility_1.administer_road_test(@registrant_3)).to be false
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
    
    it 'road test status change if service is offered' do
      expect(@facility_1.administer_road_test(@registrant_1)).to be false
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      expect(@facility_1.services).to eq(['Written Test', 'Road Test'])
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      expect(@facility_1.administer_road_test(@registrant_1)).to be true
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end


end
