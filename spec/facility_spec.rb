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

  describe '#register vehicle' do
    it 'can register a vehicle' do
      @facility.add_service("Vehicle Registration")
      expect(@facility.registered_vehicles).to eq([])
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.register_vehicle(cruz)
      expect(@facility.registered_vehicles).to eq([cruz])
    end
  end

  describe '#collected fees' do
    it 'can collect fees after registering' do
      @facility.add_service("Vehicle Registration")
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.register_vehicle(cruz)
      expect(@facility.collected_fees).to eq(100)
      
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility.register_vehicle(bolt)
      @facility.register_vehicle(camaro)
      expect(@facility.collected_fees).to eq(325)
    end
  end

  describe '#facility 2 services' do
    it 'cannot register vehicles and collect fees' do
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.services).to eq([])
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      
      expect(facility_2.register_vehicle(bolt)).to be nil
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end
  end

  describe '#administer_written_test' do
    it 'can administer a written test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      
      expect(facility_1.administer_written_test(registrant_1)).to be false
      facility_1.add_service("Written Test")
      
      expect(facility_1.administer_written_test(registrant_1)).to be true
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(facility_1.administer_written_test(registrant_2)).to be false
      registrant_2.earn_permit
      
      expect(facility_1.administer_written_test(registrant_2)).to be true
      expect(facility_1.administer_written_test(registrant_3)).to be false
      registrant_3.earn_permit
      
      expect(facility_1.administer_written_test(registrant_3)).to be false
    end
  end

  describe '#administer_road_test' do
    it 'can administer a road test' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      registrant_2.earn_permit
      registrant_3.earn_permit

      expect(facility_1.administer_road_test(registrant_3)).to be false
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(facility_1.administer_road_test(registrant_1)).to be false
      facility_1.add_service("Written Test")
      facility_1.add_service("Road Test")
      facility_1.administer_written_test(registrant_1)

      expect(facility_1.administer_road_test(registrant_1)).to be true
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      facility_1.administer_written_test(registrant_2)

      expect(facility_1.administer_road_test(registrant_2)).to be true
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe '#renew drivers license' do
    it 'can renew a drivers license' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(facility_1.renew_drivers_license(registrant_1)).to be false
      
      facility_1.add_service("Written Test")
      facility_1.add_service("Road Test")
      facility_1.add_service('Renew License')
      registrant_2.earn_permit
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_road_test(registrant_1)
      facility_1.administer_written_test(registrant_2)
      facility_1.administer_road_test(registrant_2)

      expect(facility_1.renew_drivers_license(registrant_1)).to be true
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      expect(facility_1.renew_drivers_license(registrant_3)).to be false
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(facility_1.renew_drivers_license(registrant_2)).to be true
      facility_1.renew_drivers_license(registrant_2)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end
end
