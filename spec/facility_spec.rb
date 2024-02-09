# typed: ignore

require "spec_helper"

RSpec.describe Facility do # rubocop:disable Metrics/BlockLength
  before(:each) do # rubocop:disable Metrics/BlockLength
    @facility1 = Facility.new({
      name: "DMV Tremont Branch",
      address: "2855 Tremont Place Suite 118 Denver CO 80205",
      phone: "(720) 865-4600"
    })
    @facility2 = Facility.new({
      name: "DMV Northeast Branch",
      address: "4685 Peoria Street Suite 101 Denver CO 80239",
      phone: "(720) 865-4600"
    })
    @cruz = Vehicle.new({
      vin: "123456789abcdefgh",
      year: 2012,
      make: "Chevrolet",
      model: "Cruz",
      engine: :ice
    })
    @bolt = Vehicle.new({
      vin: "987654321abcdefgh",
      year: 2019,
      make: "Chevrolet",
      model: "Bolt",
      engine: :ev
    })
    @camaro = Vehicle.new({
      vin: "1a2b3c4d5e6f",
      year: 1969,
      make: "Chevrolet",
      model: "Camaro",
      engine: :ice
    })
    @registrant = Registrant.new({
      name: "Bruce",
      age: 18,
      permit: true
    })
  end
  describe "#initialize" do
    it "can initialize" do
      expect(@facility1).to be_an_instance_of(Facility)
      expect(@facility1.name).to eq("DMV Tremont Branch")
      expect(@facility1.address).to eq(
        "2855 Tremont Place Suite 118 Denver CO 80205"
      )
      expect(@facility1.phone).to eq("(720) 865-4600")
      expect(@facility1.services).to eq([])
      expect(@facility1.registered_vehicles).to eq([])
      expect(@facility1.collected_fees).to eq(0)
    end
  end

  describe "#add service" do
    it "can add available services" do
      new_facility = @facility1
      expect(new_facility.services).to eq([])
      new_facility.add_service("New Drivers License")
      new_facility.add_service("Renew Drivers License")
      new_facility.add_service("Vehicle Registration")
      expect(new_facility.services).to eq([
        "New Drivers License",
        "Renew Drivers License",
        "Vehicle Registration"
      ])
    end
  end

  describe "#register vehicles" do
    it "can register new vehicles" do
      new_facility = @facility1
      new_facility.register_vehicle(@cruz)
      expect(new_facility.registered_vehicles).to eq([@cruz])
    end
    it "collects fees based on engine type" do
      new_facility = @facility1
      new_facility.register_vehicle(@cruz)
      new_facility.register_vehicle(@bolt)
      expect(new_facility.collected_fees).to eq(300)
    end
  end

  describe "#provide services" do # rubocop:disable Metrics/BlockLength
    it "cannot provide services it does not have" do
      facility = @facility1
      registrant = @registrant
      can_register = facility.administer_written_test(registrant)
      expect(can_register).to eq(false)
      registrant.license_data[:written] = true
      can_road_test = facility.administer_road_test(registrant)
      expect(can_road_test).to eq(false)
      registrant.license_data[:license] = true
      can_renew = facility.renew_drivers_license(registrant)
      expect(can_renew).to eq(false)
    end
    it "can provide services after they are added" do
      facility = @facility1
      registrant = @registrant
      facility.add_service("Written Test")
      expect(facility.services.include?("Written Test")).to eq(true)
      can_register = facility.administer_written_test(registrant)
      expect(can_register).to eq(true)
      facility.add_service("Road Test")
      can_road_test = facility.administer_road_test(registrant)
      expect(can_road_test).to eq(true)
      facility.add_service("Renew License")
      can_renew = facility.renew_drivers_license(registrant)
      expect(can_renew).to eq(true)
    end
    it "does not provide license services to registrants under 16" do
      facility = @facility1
      registrant = Registrant.new({
        name: "Biff",
        age: 15,
        permit: true
      })
      facility.add_service("Written Test")
      facility.add_service("Road Test")
      can_do_written_test = facility.administer_written_test(registrant)
      expect(can_do_written_test).to eq(false)
      can_get_license = facility.administer_road_test(registrant)
      expect(can_get_license).to eq(false)
    end
    it "does not give road tests to people who haven't completed the written test" do # rubocop:disable Layout/LineLength
      facility = @facility1
      registrant = @registrant
      facility.add_service("Written Test")
      facility.add_service("Road Test")
      has_license = facility.administer_road_test(registrant)
      expect(has_license).to eq(false)
      expect(registrant.license_data[:license]).to eq(false)
    end
    it "gives licenses to those who complete the road test" do
      facility = @facility1
      registrant = @registrant
      facility.add_service("Written Test")
      facility.add_service("Road Test")
      facility.administer_written_test(registrant)
      has_license = facility.administer_road_test(registrant)
      expect(has_license).to eq(true)
      expect(registrant.license_data[:license]).to eq(true)
    end
    it "does not renew licenses to those without a license" do
      facility = @facility1
      registrant = @registrant
      facility.add_service("Written Test")
      facility.add_service("Road Test")
      facility.add_service("Renew License")
      facility.administer_written_test(registrant)
      facility.renew_drivers_license(registrant)
      expect(registrant.license_data[:renewed]).to eq(false)
    end
    it "can renew licenses to those with a license" do
      facility = @facility1
      registrant = @registrant
      facility.add_service("Written Test")
      facility.add_service("Road Test")
      facility.add_service("Renew License")
      facility.administer_written_test(registrant)
      facility.administer_road_test(registrant)
      facility.renew_drivers_license(registrant)
      expect(registrant.license_data[:renewed]).to eq(true)
    end
  end
end
