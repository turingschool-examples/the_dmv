require 'spec_helper'

RSpec.describe MostPopularFinder do
    before(:each) do
        @most_popular_finder = MostPopularFinder.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations
    end

    describe '#initialize' do
        it 'exists' do
            expect(@most_popular_finder).to be_an_instance_of(MostPopularFinder)
        end
    end
end