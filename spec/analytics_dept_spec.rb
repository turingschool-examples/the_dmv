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

  # describe '#get_data' do
