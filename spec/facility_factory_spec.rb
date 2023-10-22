require 'spec_helper'

RSpec.describe FacilityFactory do
  before (:each) do 
    @factory = FacilityFactory.new
    @Colorado = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end
  describe '#Facility Factory' do
    it 'shows us Colorado data' do
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facility(@Colorado)
      expect(facilities).to be_a(Array)
      expect(@Colorado[0][:dmv_office]).to be_a(String)
      expect(facilities[0]).to be_a(Facility)
      expect(@Colorado[0][:address_li]).to be_a(String)
      expect(@Colorado[0][:address__1]).to be_a(String)
      expect(@Colorado[0][:city]).to be_a(String)
    end
    
    it 'shows us New York data' do
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facility(@new_york_facilities)
      expect(@new_york_facilities[0][:office_name]).to be_a(String)
      expect(facilities[0]).to be_a(Facility)
      expect(@new_york_facilities[0][:street_address_line_1]).to be_a(String)
      expect(@new_york_facilities[0][:city]).to be_a(String)
      expect(@new_york_facilities[0][:state]).to be_a(String)
    end

    it 'shows Missouri data' do
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facility(@missouri_facilities)
      expect(@missouri_facilities[0][:name]).to be_a(String)
      expect(facilities[0]).to be_a(Facility)
      expect(@missouri_facilities[0][:address1]).to be_a(String)
      expect(@missouri_facilities[0][:city]).to be_a(String)
      expect(@missouri_facilities[0][:state]).to be_a(String)
      # require 'pry'; binding.pry
    end
  end
end