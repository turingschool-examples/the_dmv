require 'spec_helper'

RSpec.describe Facility do
  let(:facility_1) { Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600', daily_hours: 'Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.'}) }
  let(:facility_2) { Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600', daily_hours: 'Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.'}) }
  let(:cruz) { Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice}) }
  let(:bolt) { Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev}) }
  let(:camaro) { Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice}) }
  let(:registrant_1) { Registrant.new('Bruce', 18, true) }
  let(:registrant_2) { Registrant.new('Penny', 16) }
  let(:registrant_3) { Registrant.new('Tucker', 15) }

  describe '#initialize' do
    it 'can initialize' do
      expect(facility_1).to be_an_instance_of(Facility)
      expect(facility_1.name).to eq('DMV Tremont Branch')
      expect(facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(facility_1.phone).to eq('(720) 865-4600')
      expect(facility_1.services).to eq([])
      expect(facility_1.daily_hours).to eq ("Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.")
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

  describe '#administer_written_test' do
    it "administers a written test for a registrant at least 16 years old and has a permit, then updates license data" do
      facility_1.add_service('Written Test')

      expect(facility_1.administer_written_test(registrant_1)).to eq (true)
      expect(registrant_1.license_data[:written]).to eq (true)
    end

    it "does not administers a written test for a registrant who does not have a permit" do
      facility_1.add_service('Written Test')

      expect(registrant_2.license_data[:written]).to eq (false)
      expect(facility_1.administer_written_test(registrant_2)).to eq (false)
    end

    it "does not administer a written test for a registrant under 16 years old" do
      facility_1.add_service('Written Test')

      expect(registrant_3.license_data[:written]).to eq (false)
      expect(facility_1.administer_written_test(registrant_3)).to eq (false)
    end
  end

  describe '#administer_road_test' do
    it "administer road test for a registrant who passed the written test" do
      facility_1.add_service('Written Test')
      facility_1.add_service('Road Test')
      facility_1.administer_written_test(registrant_1)

      expect(registrant_1.license_data[:license]).to eq (false)
      expect(facility_1.administer_road_test(registrant_1)).to eq (true)
      expect(registrant_1.license_data[:license]).to eq (true)
    end

    it "does not administer a road test to a registrant who haven't passed the written test" do
      facility_1.add_service('Road Test')

      expect(facility_1.administer_road_test(registrant_3)).to eq (false)
      expect(registrant_3.license_data[:license]).to eq (false)
    end
  end

  describe '#renew_driver_license' do
    it "renew driver license  for a registrant who earned driver license" do
      facility_1.add_service('Renew License')
      facility_1.add_service('Written Test')
      facility_1.add_service('Road Test')
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_road_test(registrant_1)
      facility_1.renew_driver_license(registrant_1)

      expect(facility_1.renew_driver_license(registrant_1)).to eq (true)
      expect(registrant_1.license_data[:renewed]).to eq (true)
    end

    it "does not renew driver license for a registrant who didn't earned driver license" do
      facility_1.add_service('Renew License')
      facility_1.renew_driver_license(registrant_3)

      expect(facility_1.renew_driver_license(registrant_3)).to eq (false)
      expect(registrant_3.license_data[:renewed]).to eq (false)
    end
  end
end
