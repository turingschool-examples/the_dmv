require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
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

  describe '#registered vehicles' do
    it 'can add vehicles to a facility(if vehicle registration is a service)' do
      expect(@facility.registered_vehicles).to eq([])

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.add_service("Vehicle Registration")
      @facility.register_vehicle(cruz)

      expect(@facility.registered_vehicles).to eq([cruz])

      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility_2.add_service("Vehicle Registration")
      @facility_2.register_vehicle(bolt)
      @facility_2.register_vehicle(camaro)

      expect(@facility_2.registered_vehicles).to eq([bolt, camaro])
    end
  end

  describe '#collected_fees' do
    it 'can print total fees collected from registered vehicles in that facility' do
      expect(@facility.collected_fees).to eq(0)

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility.add_service("Vehicle Registration")
      @facility.register_vehicle(cruz)
      @facility.register_vehicle(bolt)
      @facility.register_vehicle(camaro)

      expect(@facility.collected_fees).to eq(325)
    end
  end

  describe "#administer_written_test" do
    it "gives a written test to the registrant" do
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to be(false)

      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant_1)).to be(true)
      expect(@registrant_1.license_data[:written]).to be(true)
    end
  end

  describe "#administer_road_test" do
    it "gives a road test to the registrant" do
      @facility_1.administer_road_test(@registrant_1)
      expect(@facility_1.administer_road_test(@registrant_1)).to be(false)

      @facility_1.add_service("Road Test")
      expect(@facility_1.administer_road_test(@registrant_1)).to be(true)
      expect(@registrant_1.license_data[:license]).to be(true)
    end
  end
end
