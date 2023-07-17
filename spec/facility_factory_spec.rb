require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory_1 = FacilityFactory.new
    @colorado_facilities = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory_1).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_factory' do
    it 'can create a facility - colorado facilities' do
      @factory_1.create_factory(@colorado_facilities)
      expect(@factory_1.create_factory(@colorado_facilities)).to be_an Array
      expect(@factory_1.create_factory(@colorado_facilities)).to all be_a Facility
      expect(@factory_1.create_factory(@colorado_facilities).first.name).to eq("DMV Tremont Branch")
      expect(@factory_1.create_factory(@colorado_facilities).first.address).to eq({:street_add=>"2855 Tremont Place", :add_line_2=>"Suite 118", :city=>"Denver", :state=>"CO", :zip=>"80205"})
      expect(@factory_1.create_factory(@colorado_facilities).first.phone).to eq("(720) 865-4600")
      expect(@factory_1.create_factory(@colorado_facilities).first.services).to eq("vehicle titles, registration, renewals;  VIN inspections")
    end

    it 'can create a facility - new york facilities' do
      @factory_1.create_factory(@new_york_facilities)
      expect(@factory_1.create_factory(@new_york_facilities)).to be_an Array
      expect(@factory_1.create_factory(@new_york_facilities)).to all be_a Facility
      expect(@factory_1.create_factory(@new_york_facilities).first.name).to eq("JAMAICA")
      expect(@factory_1.create_factory(@new_york_facilities).first.address).to eq({:street_add=>"168-46 91ST AVE., 2ND FLR", :add_line_2=>nil, :city=>"JAMAICA", :state=>"NY", :zip=>"11432"})
      expect(@factory_1.create_factory(@new_york_facilities).first.phone).to eq("7189666155")
      expect(@factory_1.create_factory(@new_york_facilities).first.services).to eq([])
    end

    it 'can create a facility - missour facilities' do
      @factory_1.create_factory(@missouri_facilities)
      expect(@factory_1.create_factory(@missouri_facilities)).to be_an Array
      expect(@factory_1.create_factory(@missouri_facilities)).to all be_a Facility
      expect(@factory_1.create_factory(@missouri_facilities).first.name).to eq("DEXTER")
      expect(@factory_1.create_factory(@missouri_facilities).first.address).to eq({:street_add=>"119 VINE ST", :add_line_2=>nil, :city=>"DEXTER", :state=>"MO", :zip=>"63841"})
      expect(@factory_1.create_factory(@missouri_facilities).first.phone).to eq("(573) 624-8808")
      expect(@factory_1.create_factory(@missouri_facilities).first.services).to eq([])
    end
  end

end
