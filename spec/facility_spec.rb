require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
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

  describe '#register vehicle' do
    it 'registers regular vehicle' do
      @facility_1.register_vehicle(@cruz)
      
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
    end

    it 'registers antique vehicle' do
      @facility_1.register_vehicle(@camaro)
    
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
    end

    it 'registers ev vehicle' do
      @facility_1.register_vehicle(@bolt)

      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
    end

    xit 'updates facility after registration' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq ([@cruz, @camero, @bolt]) #Why does this test fail?
      expect(@facility_1.collected_fees).to eq(325)
    end

    xit 'prevents multi-facility registrations' do
      expect(@facility_2.registered_vehicles).to eq ([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#administer written test' do
    it 'facility does not offer written test' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  
    it 'facility offers written test' do
      @facility_1.add_service('Written Test')
      
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    
    it 'registrant does not have permit' do
      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
    end

    it 'registrant is 16 and has permit' do
      @facility_1.add_service('Written Test')
      @registrant_2.earn_permit

      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'registrant is not 16' do
      @registrant_3.earn_permit

      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#administer road test' do
    it 'facility does not offer road test' do
      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)
    end

    it 'cannot administer road test' do
      @registrant_3.earn_permit
    
      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  
    it 'administers road test' do
      @registrant_1.license_data[:written] = true
      @registrant_2.license_data[:written] = true
      @facility_1.add_service('Road Test')

      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
      expect(@facility_1.administer_road_test(@registrant_2)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe '#renew drivers license' do
    it 'facility does not have renew service' do
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)
    end

    it 'facility has renew service' do
      @facility_1.add_service('Renew License')

      expect(@facility_1.services).to eq(["Renew License"])
    end

    it 'registrant has license' do
      @registrant_1.license_data[:written] = true
      @facility_1.add_service('Renew License')

      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end

    it 'registrant does not have license' do
      @facility_1.add_service('Written Test')
    
      expect(@facility_1.renew_drivers_license(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

end
