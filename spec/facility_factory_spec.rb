require 'spec_helper'

RSpec.describe FacilityFactory do
  describe "#initialize" do
    it "can initialize" do
      factory = FacilityFactory.new

      expect(factory).to be_a(FacilityFactory)
    end
  end

  describe "#create_facilities_co" do
    it "can create facilities for Colorado DMV locations" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)

      expect(factory.create_facilities(co_dmv_office_locations)[0]).to be_a(Facility)
      expect(factory.create_facilities(co_dmv_office_locations)[0].name).to eq("Dmv Tremont Branch")
      expect(factory.create_facilities(co_dmv_office_locations)[0].address).to eq("2855 Tremont Place Suite 118 Denver, CO 80205")
      expect(factory.create_facilities(co_dmv_office_locations)[0].phone).to eq("(720) 865-4600")
    end
  end

  describe "#create_facilities_ny" do
    it "can create facilities for New York DMV locations" do
      factory = FacilityFactory.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      factory.create_facilities(ny_dmv_office_locations)

      expect(factory.create_facilities(ny_dmv_office_locations)[0]).to be_a(Facility)
      expect(factory.create_facilities(ny_dmv_office_locations)[0].name).to eq("Jamaica")
      expect(factory.create_facilities(ny_dmv_office_locations)[0].address).to eq("168-46 91st Ave., 2nd Flr Jamaica, NY 11432")
      expect(factory.create_facilities(ny_dmv_office_locations)[0].phone).to eq("(718) 966-6155")
    end
  end

  describe "#create_facilities_mo" do
    it "can create facilities for Missouri DMV locations" do
      factory = FacilityFactory.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      factory.create_facilities(mo_dmv_office_locations)

      expect(factory.create_facilities(mo_dmv_office_locations)[0]).to be_a(Facility)
      expect(factory.create_facilities(mo_dmv_office_locations)[0].name).to eq("Dexter")
      expect(factory.create_facilities(mo_dmv_office_locations)[0].address).to eq("119 Vine St Dexter, MO 63841")
      expect(factory.create_facilities(mo_dmv_office_locations)[0].phone).to eq("(573) 624-8808")
    end
  end

  describe "#valid_co_address" do
    it "matches keys from the Colorado dataset to ensure creation of new facility with correct key:value pairs" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)

      expect(factory.valid_co_address(co_dmv_office_locations[0])).to eq(true)
      expect(factory.valid_co_address(co_dmv_office_locations[1])).to eq(true)
    end
  end

  describe "#valid_ny_address" do
    it "matches keys from the New York dataset to ensure creation of new facility with correct key:value pairs" do
      factory = FacilityFactory.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      factory.create_facilities(ny_dmv_office_locations)

      expect(factory.valid_ny_address(ny_dmv_office_locations[0])).to eq(true)
      expect(factory.valid_ny_address(ny_dmv_office_locations[1])).to eq(true)
    end
  end

  describe "#valid_mo_address" do
    it "matches keys from the Missouri dataset to ensure creation of new facility with correct key:value pairs" do
      factory = FacilityFactory.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      factory.create_facilities(mo_dmv_office_locations)

      expect(factory.valid_mo_address(mo_dmv_office_locations[0])).to eq(true)
      expect(factory.valid_mo_address(mo_dmv_office_locations[1])).to eq(true)
    end
  end

  describe "#name_and_address_filter" do
    it "can capitalize each word in the name or address value passed through it" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)
      factory.create_facilities(ny_dmv_office_locations)
      factory.create_facilities(mo_dmv_office_locations)
      
      expect(factory.name_and_address_filter(factory.create_facilities(co_dmv_office_locations)[0].name)).to eq("Dmv Tremont Branch")
      expect(factory.name_and_address_filter(factory.create_facilities(co_dmv_office_locations)[0].address)).to eq("2855 Tremont Place Suite 118 Denver, Co 80205")
      expect(factory.name_and_address_filter(factory.create_facilities(ny_dmv_office_locations)[0].name)).to eq("Jamaica")
      expect(factory.name_and_address_filter(factory.create_facilities(ny_dmv_office_locations)[0].address)).to eq("168-46 91st Ave., 2nd Flr Jamaica, Ny 11432")
      expect(factory.name_and_address_filter(factory.create_facilities(mo_dmv_office_locations)[0].name)).to eq("Dexter")
      expect(factory.name_and_address_filter(factory.create_facilities(mo_dmv_office_locations)[0].address)).to eq("119 Vine St Dexter, Mo 63841")
    end
  end

  describe "#phone_filter" do
    it "can format phone numbers passed through to follow the pattern (xxx) xxx-xxxx" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)
      factory.create_facilities(ny_dmv_office_locations)
      factory.create_facilities(mo_dmv_office_locations)

      expect(factory.phone_filter(factory.create_facilities(co_dmv_office_locations)[0].phone)).to eq("(720) 865-4600")
      expect(factory.phone_filter(factory.create_facilities(ny_dmv_office_locations)[0].phone)).to eq("(718) 966-6155")
      expect(factory.phone_filter(factory.create_facilities(mo_dmv_office_locations)[0].phone)).to eq("(573) 624-8808")
    end
  end
end