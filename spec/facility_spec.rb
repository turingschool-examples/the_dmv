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
  before(:all) do
    @co_office = DmvDataService.new.co_dmv_office_locations[0]
    @ny_office = DmvDataService.new.ny_dmv_office_locations[0]
    @mo_office = DmvDataService.new.mo_dmv_office_locations[0]
    @co_facility = Facility.new({
      name: @co_office[:dmv_office],
      address: @co_office[:address_li],
      phone: @co_office[:phone]
    })
    @ny_facility = Facility.new({
      name: @ny_office[:office_name],
      address: @ny_office[:street_address_line_1], # rubocop:disable Naming/VariableNumber
      phone: @ny_office[:public_phone_number]
    })
    @mo_facility = Facility.new({
      name: @mo_office[:name],
      address: @mo_office[:address1],
      phone: @mo_office[:phone]
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
      expect(@facility1.services).to eq([])
      @facility1.add_service("New Drivers License")
      @facility1.add_service("Renew Drivers License")
      @facility1.add_service("Vehicle Registration")
      expect(@facility1.services).to eq([
        "New Drivers License",
        "Renew Drivers License",
        "Vehicle Registration"
      ])
    end
  end

  describe "#register vehicles" do
    it "can register new vehicles" do
      @facility1.register_vehicle(@cruz)
      expect(@facility1.registered_vehicles).to eq([@cruz])
    end
    it "collects fees based on engine type" do
      @facility1.register_vehicle(@cruz)
      @facility1.register_vehicle(@bolt)
      expect(@facility1.collected_fees).to eq(300)
    end
  end

  describe "#provide services" do # rubocop:disable Metrics/BlockLength
    it "cannot provide services it does not have" do
      can_register = @facility1.administer_written_test(@registrant)
      expect(can_register).to eq(false)
      @registrant.license_data[:written] = true
      can_road_test = @facility1.administer_road_test(@registrant)
      expect(can_road_test).to eq(false)
      @registrant.license_data[:license] = true
      can_renew = @facility1.renew_drivers_license(@registrant)
      expect(can_renew).to eq(false)
    end
    it "can provide services after they are added" do
      @facility1.add_service("Written Test")
      expect(@facility1.services.include?("Written Test")).to eq(true)
      can_register = @facility1.administer_written_test(@registrant)
      expect(can_register).to eq(true)
      @facility1.add_service("Road Test")
      can_road_test = @facility1.administer_road_test(@registrant)
      expect(can_road_test).to eq(true)
      @facility1.add_service("Renew License")
      can_renew = @facility1.renew_drivers_license(@registrant)
      expect(can_renew).to eq(true)
    end
    it "does not provide license services to registrants under 16" do
      @facility1.add_service("Written Test")
      @facility1.add_service("Road Test")
      registrant = Registrant.new({
        name: "Youngun",
        age: 15,
        permit: true
      })
      can_do_written_test = @facility1.administer_written_test(registrant)
      expect(can_do_written_test).to eq(false)
      can_get_license = @facility1.administer_road_test(registrant)
      expect(can_get_license).to eq(false)
    end
    it "does not give road tests to people who haven't completed the written test" do # rubocop:disable Layout/LineLength
      @facility1.add_service("Written Test")
      @facility1.add_service("Road Test")
      has_license = @facility1.administer_road_test(@registrant)
      expect(has_license).to eq(false)
      expect(@registrant.license_data[:license]).to eq(false)
    end
    it "gives licenses to those who complete the road test" do
      @facility1.add_service("Written Test")
      @facility1.add_service("Road Test")
      @facility1.administer_written_test(@registrant)
      has_license = @facility1.administer_road_test(@registrant)
      expect(has_license).to eq(true)
      expect(@registrant.license_data[:license]).to eq(true)
    end
    it "does not renew licenses to those without a license" do
      @facility1.add_service("Written Test")
      @facility1.add_service("Road Test")
      @facility1.add_service("Renew License")
      @facility1.administer_written_test(@registrant)
      can_renew = @facility1.renew_drivers_license(@registrant)
      expect(can_renew).to eq(false)
      expect(@registrant.license_data[:renewed]).to eq(false)
    end
    it "can renew licenses to those with a license" do
      @facility1.add_service("Written Test")
      @facility1.add_service("Road Test")
      @facility1.add_service("Renew License")
      @facility1.administer_written_test(@registrant)
      @facility1.administer_road_test(@registrant)
      can_renew = @facility1.renew_drivers_license(@registrant)
      expect(can_renew).to eq(true)
      expect(@registrant.license_data[:renewed]).to eq(true)
    end
  end

  describe "#create facilities from external data" do
    it "can populate data from CO office locations" do
      expect(@co_facility.name.nil?).to eq(false)
      expect(@co_facility.address.nil?).to eq(false)
      expect(@co_facility.phone.nil?).to eq(false)
    end
    it "can populate data from NY office locations" do
      expect(@ny_facility.name.nil?).to eq(false)
      expect(@ny_facility.address.nil?).to eq(false)
      expect(@ny_facility.phone.nil?).to eq(false)
    end
    it "can populate data from MO office locations" do
      expect(@mo_facility.name.nil?).to eq(false)
      expect(@mo_facility.address.nil?).to eq(false)
      expect(@mo_facility.phone.nil?).to eq(false)
    end
  end
end
