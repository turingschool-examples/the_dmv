require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
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
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "#register_vehicle" do
    it "adds a vehicle to the registered_vehicles array" do
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)

      expect(@facility.registered_vehicles).to include(@cruz, @bolt)
    end

    it "charges fees and assigns plate types based on vehicle type" do
      @facility.register_vehicle(@cruz)

      expect(@facility.collected_fees).to eq(100)

      @facility.register_vehicle(@bolt)

      expect(@facility.collected_fees).to eq(300)

      @facility.register_vehicle(@camaro)

      expect(@facility.collected_fees).to eq(325)

      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
    end
  end

  describe "#administer_written_test" do
    it "errors out if registrant is younger than 16, or if registrant lacks a permit" do
      registrant_1 = Registrant.new("Bruce", 18, false)
      registrant_2 = Registrant.new("Penny", 15, true)

      expect(@facility.administer_written_test(registrant_1)).to eq("Error: Written tests can only be administered to registrants with a permit, and who are at least 16 years of age.")
      expect(@facility.administer_written_test(registrant_2)).to eq("Error: Written tests can only be administered to registrants with a permit, and who are at least 16 years of age.")
    end

    it "administers written test if registrant is 16 or older, and has a permit" do
      registrant = Registrant.new("Chrysanthemum", 16, true)
      @facility.administer_written_test(registrant)

      expect(registrant.license_data[:written]).to eq true
    end
  end

  describe "#administer_road_test" do
    it "errors out if a registrant has not passed a written test" do
      registrant_1 = Registrant.new("Bruce", 18, true)
      registrant_2 = Registrant.new("Penny", 15)

      expect(@facility.administer_road_test(registrant_1)
      ).to eq("Error: Road tests can only be administered to registrants who have passed a written test.")
      expect(@facility.administer_road_test(registrant_2)
      ).to eq("Error: Road tests can only be administered to registrants who have passed a written test.")
    end

    it "administers a road test if registrant passed a written test" do
      registrant_1 = Registrant.new("Bruce", 18, true)
      @facility.administer_written_test(registrant_1)
      @facility.administer_road_test(registrant_1)

      expect(registrant_1.license_data[:license]).to eq true
    end
  end

  describe "#renew_drivers_license" do
    it "errors out if the registrant does not have a pre-existing license" do
      registrant_1 = Registrant.new("Bruce", 18, true)

      expect(@facility.renew_drivers_license(registrant_1)).to eq("Error: Registrant does not have a license to renew.")
    end
  
    it "renews an existing drivers license" do
      registrant_1 = Registrant.new("Bruce", 18, true)
      @facility.administer_written_test(registrant_1)
      @facility.administer_road_test(registrant_1)

      expect(registrant_1.license_data[:renewed]).to eq false

      @facility.renew_drivers_license(registrant_1)

      expect(registrant_1.license_data[:renewed]).to eq true
    end
  end
end
