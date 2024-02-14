require 'spec_helper'

RSpec.describe Analytics.new do

  before(:each) do
    @analytics = Analytics.new
  end

  describe '#initialize' do
  it 'can initialize' do
    expect(@analytics).to be_an_instance_of(Analytics)
  end
end

  describe "#most_popular_car" do
    it "finds the most popular car make and model" do
      expect(@analytics.most_popular_car).to eq("TESLA Model 3")
    end
  end


end
