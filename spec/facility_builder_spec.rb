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
      @facility_data = @builder.build_facility_helper(@data)
      expect(@facility_data).to be_an_instance_of(Array)
      expect(@facility_data.length).to eq(@data.length)
    end

    it 'formats data to be used by Facility class' do
      @facility_data = @builder.build_facility_helper(@data)
      expect(@facility_data.first).to eq({:name=>"DMV Tremont Branch", :address=>"2855 Tremont Place Denver CO 80205", :phone=>"(720) 865-4600"})
    end
  end

  describe '@build facility' do
    before(:each) do
      @data = DmvDataService.new.co_dmv_office_locations
      @builder = FacilityBuilder.new
    end
    it 'Will create an array of facilities using a provided data set' do
      @facilities = @builder.build_facility(@data)
      expect(@facilities).to be_an_instance_of(Array)
      expect(@facilities.lenght).to eq(@data.length)
    end
    
    it 'Will create an instance of Facility class for each element from given data set' do
      @facilities = @builder.build_facility(@data)
      expect(@facilities.first).to be_an_instance_of(Facility)
    end
  end
end