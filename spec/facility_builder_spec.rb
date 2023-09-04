require 'spec_helper'
require 'pry'

RSpec.describe FacilityBuilder do
  before(:each) do
     @builder = FacilityBuilder.new
  end
  it 'exists' do
    expect(@builder).to be_an_instance_of(FacilityBuilder)
  end
  
  describe '#build facility helper' do
    before(:each) do
      @data = DmvDataService.new.co_dmv_office_locations
      @builder = FacilityBuilder.new
    end
    it 'extracts needed elements from the given data set' do
      facility_data = @builder.build_facility_helper(@data)
      expect(facility_data).to be_an_instance_of(Array)
      expect(facility_data.length).to eq(@data.length)
    end

    it 'formats data to be used by Facility class' do
      facility_data = @builder.build_facility_helper(@data)
      expect(facility_data.first).to eq({:address=>"2855 Tremont Place Suite 118 Denver CO 80205", :name=>"DMV Tremont Branch", :phone=>"(720) 865-4600"})
    end

    it 'will work with a data set from NY' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      facility_data = @builder.build_facility_helper(new_york_facilities)
      expect(facility_data).to be_an_instance_of(Array)
      expect(facility_data.length).to eq(new_york_facilities.length)
      expect(facility_data.first).to eq({:name=>"EVANS", :address=>"6853 ERIE RD DERBY NY 14006", :phone=>"7168587450"})
    end

    it 'will work with a data set from MO' do
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      facility_data = @builder.build_facility_helper(missouri_facilities)
      expect(facility_data).to be_an_instance_of(Array)
      expect(facility_data.length).to eq(missouri_facilities.length)
      expect(facility_data.first).to eq({:name=>"OAKVILLE", :address=>"3164 TELEGRAPH ROAD ST LOUIS MO 63125", :phone=>"(314) 887-1050"})
    end
  end

  describe '#build facility' do
    before(:each) do
      @data = DmvDataService.new.co_dmv_office_locations
      @builder = FacilityBuilder.new
    end
    it 'Will create an array of facilities using a provided data set' do
      facilities = @builder.build_facility(@data)
      expect(facilities).to be_an_instance_of(Array)
      expect(facilities.length).to eq(@data.length)
    end
    
    it 'Will create an instance of Facility class for each element from given data set' do
      facilities = @builder.build_facility(@data)
      expect(facilities.first).to be_an_instance_of(Facility)
    end

    it 'Will work with other data sets' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      facilities = @builder.build_facility(new_york_facilities)
      expect(facilities).to be_an_instance_of(Array)
      expect(facilities.length).to eq(new_york_facilities.length)
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      facilities = @builder.build_facility(missouri_facilities)
      expect(facilities).to be_an_instance_of(Array)
      expect(facilities.length).to eq(missouri_facilities.length)
    end
  end

end