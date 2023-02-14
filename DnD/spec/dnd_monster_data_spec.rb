require 'spec_helper'
RSpec.describe DmvDataService do
  before(:each) do
    @dds = DmvDataService.new
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@dds).to be_an_instance_of(DmvDataService)
    end
  end

  describe '#load_data' do
    it 'can load data from a given source' do
      source = 'https://data.oregon.gov/resource/rj4w-f4jc.json'
      data_response = @dds.load_data(source)
      expect(data_response).to be_an_instance_of(Array)
      expect(data_response.size).to eq(59)
    end