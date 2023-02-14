require './lib/dmv_data_service'
require './lib/analysis_bot'

RSpec.describe AnalysisBot do
  washington_vehicles = DmvDataService.new.wa_ev_registrations
  jeremy = AnalysisBot.new

  it "can produce the most common make and model" do
    # I tested this one almost entirely with pry. I couldn't come
    # up with a way to test each step of the process without just
    # making every single variable public, which just didn't seem
    # like the best way to go. So I had a pry line at the end of the
    # method which allowed me to test every new line.

    expect(jeremy.most_common_vehicle(washington_vehicles)).to eq("TESLA Model 3")
  end
end