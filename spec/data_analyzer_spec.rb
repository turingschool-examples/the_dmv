require 'spec_helper'

RSpec.describe DataAnalyzer do
  describe 'EV registration' do
    before(:each) do
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @data = DataAnalyzer.new(@wa_ev_registrations)
    end
  
    it '.most_model' do
      expect(@data).to be_a(DataAnalyzer)
      expect(@data.most_model).to be_a String

      # expect(@data.descending_model_list.first).to eq(["Leaf", 202])
      # expect(@data.most_model).to eq("Leaf")
    end
    
    it '.most_make' do
      expect(@data.most_make).to be_a String

      # expect(@data.descending_make_list.first).to eq(["TESLA", 358])
      # expect(@data.most_make).to eq("TESLA")
    end
    
    it '.model_year_count' do
      expect(@data.model_year_count("2019")).to be_an Integer

      # expect(@data.model_year_count("2019")).to eq(87)
    end

    it '.most_registered_county' do
      expect(@data.most_registered_county).to be_a String

      # expect(@data.descending_county_list.first).to eq(["King", 799])
      # expect(@data.most_registered_county).to eq("King")
    end

  describe 'facility analytics' do
    before(:each) do
      @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      @co_data = DataAnalyzer.new(@co_dmv_office_locations)
      @ny_data = DataAnalyzer.new(@co_dmv_office_locations)
      @mo_data = DataAnalyzer.new(@co_dmv_office_locations)
    end

    it 'exists' do
      expect(@co_data).to be_a(DataAnalyzer)
      expect(@ny_data).to be_a(DataAnalyzer)
      expect(@mo_data).to be_a(DataAnalyzer)
    end

  end

end

end
