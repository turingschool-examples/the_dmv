require './lib/dmv_data_service'
require './lib/analysis_bot'

RSpec.describe AnalysisBot do
  describe "EV registrations" do
    washington_vehicles = DmvDataService.new.wa_ev_registrations
    jeremy = AnalysisBot.new

    it "can produce the most common make and model" do
      # I tested this one almost entirely with pry. I couldn't come
      # up with a way to test each step of the process in an RSpec file
      # without just making every single variable public, which just 
      # didn't seem like the best way to go. So I had a pry line at
      # the end of the method which allowed me to test every new line.

      expect(jeremy.most_common_vehicle(washington_vehicles)).to eq("TESLA Model 3")
    end

    it "can return number of cars for a given year" do
      expect(jeremy.cars_this_year(washington_vehicles, 2018)). to eq(106)
      expect(jeremy.cars_this_year(washington_vehicles, 2016)).to eq(88)
    end

    it "can return county with highest number of registered cars" do
      expect(jeremy.county_highest_registrations(washington_vehicles)).to eq("King")
    end
  end

end