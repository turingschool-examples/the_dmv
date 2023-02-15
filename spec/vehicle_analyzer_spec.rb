require 'spec_helper'

RSpec.describe VehicleAnalyzer do
  before(:each) do
    @analyzer = VehicleAnalyzer.new(DmvDataService.new.wa_ev_registrations)
  end

  it 'exists' do
    expect(@analyzer).to be_a(VehicleAnalyzer)
  end

  it 'counts model years' do
    expect(@analyzer.count_model_year(2020)).to eq(71) #true as of 2/14/23
    expect(@analyzer.count_model_year(2015)).to eq(97) #true as of 2/14/23
    expect(@analyzer.count_model_year(2012)).to eq(20) #true as of 2/14/23
    expect(@analyzer.count_model_year("2012")).to eq(20) #true as of 2/14/23
  end

  it 'finds the most registered county' do
    expect(@analyzer.most_registered_county).to be_a(String)
    expect(@analyzer.most_registered_county).to eq('King county: 729 registrations') #true as of 2/14/23
  end

  it 'finds the most popular make/model' do
    expect(@analyzer.most_popular_car).to be_a(String)
    expect(@analyzer.most_popular_car).to eq("NISSAN Leaf: 256 registrations") #true as of 2/14/23
  end
end
