require 'spec_helper'

RSpec.describe Facility do
  let(:facility_1) { Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'}) }
  let(:facility_2) { Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'}) }
  let(:cruz) { Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice}) }
  let(:bolt) { Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev}) }
  let(:camaro) { Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice}) }

  describe '#initialize' do
    it 'can initialize' do
      expect(facility_1).to be_an_instance_of(Facility)
      expect(facility_1.name).to eq('DMV Tremont Branch')
      expect(facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(facility_1.phone).to eq('(720) 865-4600')
      expect(facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(facility_1.services).to eq([])
      facility_1.add_service('New Drivers License')
      facility_1.add_service('Renew Drivers License')
      facility_1.add_service('Vehicle Registration')
      expect(facility_1.services).to eq (['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#collect_fees' do
    it 'fees when register a vehicle based on plate type' do
      facility_1.collect_fees(cruz)
      facility_1.collect_fees(bolt)
      facility_1.collect_fees(camaro)

      expect(facility_1.collected_fees).to eq (325)
    end
  end

  describe '#register_vehicle' do
    it "can register a vehicle at facility_1" do
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(bolt)
      facility_1.register_vehicle(camaro)

      expect(facility_1.registered_vehicles).to eq ([cruz, bolt, camaro])
    end

    it "can't register a vehicle at facility_2" do
      facility_2.register_vehicle(bolt)

      expect(facility_2.register_vehicle(bolt)).to eq (nil)
      expect(facility_2.registered_vehicles).to eq ([])
    end
  end

end
