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
    it 'can register a vehicle' do
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      expect(camaro.plate_type).to eq(nil)
      @facility.register_vehicle(camaro)
      expect(camaro.plate_type).to eq(:antique)

      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      expect(bolt.plate_type).to eq(nil)
      @facility.register_vehicle(bolt)
      expect(bolt.plate_type).to eq(:ev)
    end
  end

  describe "#administer_written_test" do
    it "can administer a written test to registrants with a permit and who are at least 16 years of age" do
      registrant_1 = Registrant.new("Bruce", 18, true)
      expect(@facility.administer_written_test(registrant_1)).to be(false)
      @facility.add_service("Written Test")
      expect(@facility.administer_written_test(registrant_1)).to be(true)
      @facility.administer_written_test(registrant_1)

      expect(registrant_1.license_data[:written]).to be(true)
    end
  end

  describe "#administer_road_test" do
    it "can administer a road test can only be administered to registrants who have passed the written test" do
      registrant_1 = Registrant.new("Bruce", 18, true)
      @facility.add_service("Written Test")
      @facility.administer_written_test(registrant_1)
      expect(@facility.administer_road_test(registrant_1)).to be(false)
      @facility.add_service("Road Test")
      @facility.administer_road_test(registrant_1)

      expect(registrant_1.license_data[:license]).to be(true)
    end
  end

end
