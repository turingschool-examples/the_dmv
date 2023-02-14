require './lib/dmv_data_service'

RSpec.describe AnalysisBot do
  washington_vehicles = DmvDataService.new.wa_ev_registrations
  jeremy = AnalysisBot.new

  it "can produce the most common make and model" do
    p jeremy.most_common_vehicle(washington_vehicles)
  end
end