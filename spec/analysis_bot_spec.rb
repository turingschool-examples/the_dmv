require './lib/dmv_data_service'
require './lib/analysis_bot'

RSpec.describe AnalysisBot do
  washington_vehicles = DmvDataService.new.wa_ev_registrations
  jeremy = AnalysisBot.new

  it "can produce the most common make and model" do
    
  end
end