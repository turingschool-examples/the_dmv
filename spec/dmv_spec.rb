# typed: ignore

require "spec_helper"

RSpec.describe Dmv do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @dmv = Dmv.new
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
    @facility3 = Facility.new({
      name: "DMV Northwest Branch",
      address: "3698 W. 44th Avenue Denver CO 80211",
      phone: "(720) 865-4600"
    })
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
    end
  end

  describe "#add facilities" do
    it "can add available facilities" do
      expect(@dmv.facilities).to eq([])
      @dmv.add_facility(@facility1)
      expect(@dmv.facilities).to eq([@facility1])
    end
  end

  describe "#facilities_offering_service" do
    it "can return list of facilities offering a specified Service" do
      @facility1.add_service("New Drivers License")
      @facility1.add_service("Renew Drivers License")
      @facility2.add_service("New Drivers License")
      @facility2.add_service("Road Test")
      @facility2.add_service("Written Test")
      @facility3.add_service("New Drivers License")
      @facility3.add_service("Road Test")

      @dmv.add_facility(@facility1)
      @dmv.add_facility(@facility2)
      @dmv.add_facility(@facility3)

      expect(@dmv.facilities_offering_service("Road Test")).to eq([@facility2,
                                                                   @facility3])
    end
  end
end
