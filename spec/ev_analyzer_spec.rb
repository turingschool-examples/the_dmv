require 'spec_helper'

RSpec.describe EvAnalyzer do
  before(:each) do
    @analyzer = EvAnalyzer.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @analyzer.get_vehicles(wa_ev_registrations)
  end

  it 'exists' do
    expect(@analyzer).to be_an(EvAnalyzer)
  end

  it 'counts model years' do
    expect(@analyzer.count_model_year('2012')).to be_an(Integer)
    expect(@analyzer.count_model_year('2012')).to eq(38)
  end

  it 'finds the most registered county' do
    expect(@analyzer.most_registered_county).to eq('King county: 523 registrations')
  end

  xit 'finds the most popular make/model' do
    expect(@analyzer.find_most_popular(@vehicles)).to eq()
    expect(wa_ev_vehicles[0]).to be_a(Vehicle)
    expect(wa_ev_vehicles[0].engine).to eq(:ev)
  end
end
