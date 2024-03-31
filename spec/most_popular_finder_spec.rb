require 'spec_helper'

RSpec.describe MostPopularFinder do
    before(:each) do
        @most_popular_finder = MostPopularFinder.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations
    end
end