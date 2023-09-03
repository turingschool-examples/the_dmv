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

    end
  end

  describe '#find_popular' do
    it 'can find the most popular make' do

    end

    it 'can find the most popular model' do

    end
  end

  describe '#model_year_count' do
    it 'can return the amount of vehicles measured for any model year' do

    end
  end

  describe '#county_with_most_registered_vehicles' do
    it 'will return the county with the most registerd vehicles for a data set' do

    end
  end
end

