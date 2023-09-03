require 'spec_helper'

RSpec.describe AnalyticsDept do
  before(:each) do
    @analytics_dept = AnalyticsDept.new
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@analytics_dept).to be_an_instance_of(AnalyticsDept)
    end

    it 'starts with no data' do
      expect(@analytics_dept.current_data).to eq(nil)
    end
  end

  describe '#get_data' do
    it 'can get data and assign it as current data' do
      @analytics_dept.get_data
      expect(analytics_dept.current_data).to be_an_instance_of(Array)
      @analytics_dept.current_data.each do |vehicle_hash|
        expect(vehicle_hash).to be_an_instance_of(Hash)
      end
    end
  end

  describe '#find_popular' do
    it 'can find the most popular make' do
      @analytics_dept.get_data
      expect(@analytics_dept.find_popular(:make)).to be_an_instance_of(String)
    end

    it 'can find the most popular model' do
      @analytics_dept.get_data
      expect(@analytics_dept.find_popular(:model)).to be_an_instance_of(String)
    end

    it 'will not run if there is no data' do
      expect(@analytics_dept.find_popular(:make)).to be False
      expect(@analytics_dept.find_popular(:model)).to be False
    end
  end

  describe '#model_year_count' do
    it 'can return the amount of vehicles measured for any model year' do
      @analytics_dept.get_data
      expect(@analytics_dept.model_year_count("2015")).to be_an_instance_of(Integer)
      expect(@analytics_dept.model_year_count("2022")).to be_an_instance_of(Integer)
    end

    it 'will not run if there is no data' do
      expect(@analytics_dept.model_year_count).to be False
    end
  end

  describe '#county_with_most_registered_vehicles' do
    it 'will return the county with the most registerd vehicles for a data set' do
      @analytics_dept.get_data
      expect(@analytics_dept.county_with_most_registered_vehicles).to be_an_instance_of(String)
    end

    it 'will not run if there is no data' do
      expect(@analytics_dept.county_with_most_registered_vehicles).to be False
    end
  end
end

