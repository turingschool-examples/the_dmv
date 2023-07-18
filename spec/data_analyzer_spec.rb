require 'spec_helper'

RSpec.describe DataAnalyzer do
  it ".most_model" do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    data = DataAnalyzer.new(wa_ev_registrations)
    expect(data).to be_a(DataAnalyzer)
    expect(data.most_model).to be_a String
    expect(data.descending_model_list.first).to eq(["Leaf", 202])
    expect(data.most_model).to eq("Leaf")
  end
  
  it ".most_make" do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    data = DataAnalyzer.new(wa_ev_registrations)
    expect(data).to be_a(DataAnalyzer)
    expect(data.most_make).to be_a String
    expect(data.descending_make_list.first).to eq(["TESLA", 358])
    expect(data.most_make).to eq("TESLA")
  end
  
  it ".model_year_count" do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    data = DataAnalyzer.new(wa_ev_registrations)
    expect(data).to be_a(DataAnalyzer)
    expect(data.model_year_count("2019")).to be_an Integer
    expect(data.model_year_count("2019")).to eq(87)
  end
end
