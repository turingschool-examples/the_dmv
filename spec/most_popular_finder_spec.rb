require 'spec_helper'

RSpec.describe MostPopularFinder do
    before(:each) do
        @most_popular_finder = MostPopularFinder.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    describe '#initialize' do
        it 'exists' do
            expect(@most_popular_finder).to be_an_instance_of(MostPopularFinder)
        end

        it 'has a factory' do
            expect(@most_popular_finder.factory).to be_an_instance_of(VehicleFactory)
        end
    end

    it 'loads data for WA EV registrations' do
        expect(@wa_ev_registrations).to be_an_instance_of(Array)
    end
end