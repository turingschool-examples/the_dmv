require 'spec_helper'
require 'pry'

RSpec.describe FacilityBuilder do
  before(:each) do
     @data = DmvDataService.new.co_dmv_office_locations
     @builder = FacilityBuilder.new
  end
  it 'exists' do
    expect(@builder).to be_an_instance_of(FacilityBuilder)
  end
  
  describe '#build facility helper' do
    before(:each) {@location_data = builder.build_facility_helper(@data)}
    it 'extracts needed elements from the given data set' do
      expect(@location_data).to be_an_instance_of(Array)
      expect(@location_data.length).to eq(@data.length)
    end

    xit 'formats data to be used by Facility class' do
      expect(@location_data.first).to eq(edit)
    end
  end

  describe '@build facility' do
    before(:each) { @locations = @builder.build_facility(@data) }
    it 'Will create an array of facilities using a provided data set' do
      expect(@locations).to be_an_instance_of(Array)
      expect(@locations.lenght).to eq(@data.length)
    end

    it 'Will create an instance of Facility class for each element from given data set' do
      expect(@locations.first).to be_an_instance_of(Facility)
    end
  end
end