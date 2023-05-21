require 'spec_helper'

RSpec.describe Dmv do
  describe '#initialize' do
    it 'can initialize' do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
    end
  end

  describe '#add facilities' do

  it "can create facility instances" do 
    @dmv.add_facility(@new_facility{})
    expect(@new_facility).to be_an_instance_of(Facility) 
  end 

    it 'can add available facilities' do
      @dmv.add_facility(@facility_1)
      expect(@dmv.facilities).to eq([@facility_1])
    end
  end

  describe '#facilities_offering_service' do
    it "can add services to a facility" do 
      @dmv.add_facility(@facility_1)
      @facility_1.add_service('Road Test')
      expect(@facility_1.services).to eq("Road Test")
    end 

    it 'can return list of facilities offering a specified Service' do
      @dmv.add_facility(@facility_1)
      @dmv.add_facility(@facility_2)
      @facility_1.add_service('New Drivers License')
      @facility_2.add_service('New Drivers License')
      expect(@dmv.facilities_offering_service('New Drivers License')).to eq([@facility_1, @facility_2])
    end


    it "can create properly organized facility instances from imported API data" do 
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      @dmv.add_facility(or_dmv_office_locations)
      @dmv.add_facility(ny_dmv_office_locations)
      expect(@dmv.facilities[0].count).to eq(59)
      expect(@dmv.facilities[1].count).to eq(172)
    end 

    it "can organize data into specified key value pairs" do 
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      @dmv.add_facility(or_dmv_office_locations)
      @dmv.add_facility(ny_dmv_office_locations)
      
      expect(@dmv.facilities[0][0].name).to eq ("Albany DMV Office")
      expect(@dmv.facilities[1][0].name).to eq ("JAMAICA KIOSK")

      expect(@dmv.facilities[0][0].address).to eq ("2242 Santiam Hwy SE")
      expect(@dmv.facilities[1][0].address).to eq ("168-46 91ST AVE., 2ND FLR")

      expect(@dmv.facilities[0][0].phone_number).to eq ("541-967-2014")
      expect(@dmv.facilities[1][0].phone_number).to eq (nil)
      expect(@dmv.facilities[1][1].phone_number).to eq ("5857531604")
    end  
  end
end
