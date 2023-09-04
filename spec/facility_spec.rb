require 'spec_helper'


RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_3 = Facility.new({name: 'DMV Northwest Branch', address: '3698 W. 44th Avenue Denver CO 80211', phone: '(720) 865-4600'})
  
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
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end

  end

  describe '#register a vehicle' do
    it 'can register the cruz at facility 1' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      # expect(@facility_1.registered_vehicles).to be_a(@cruz) ??? not sure how to write this test
      expect(@facility_1.collected_fees).to eq(100)
    end
    it 'can register the camaro and bolt as well' do
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@cruz)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      # expect(@facility_1.registered_vehicles).to be_a(Vehicle) ??? not sure how to write this test
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#updates license data' do
    it 'administers a written test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(registrant_1.permit?).to be true
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@facility_1.administer_written_test(registrant_1)).to be false
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(registrant_1)).to be true
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(@facility_1.administer_written_test(registrant_2)).to be false
      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to be false
      expect(@facility_1.administer_written_test(registrant_2)).to be false
      registrant_2.earn_permit
      expect(@facility_1.administer_written_test(registrant_2)).to be true
      expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit?).to be false
      expect(@facility_1.administer_written_test(registrant_3)).to be false
      registrant_3.earn_permit
      expect(@facility_1.administer_written_test(registrant_3)).to be false
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'administers a road test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(@facility_1.administer_road_test(registrant_3)).to be false
      registrant_3.earn_permit
      expect(@facility_1.administer_road_test(registrant_3)).to be false
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@facility_1.administer_road_test(registrant_1)).to be false
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(registrant_1)).to be true
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      expect(@facility_1.administer_road_test(registrant_2)).to be true
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end
end
