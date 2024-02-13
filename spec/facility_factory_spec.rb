require 'spec_helper.rb'

RSpec.describe FacilityFactory do

    before(:each) do
        @factory = FacilityFactory.new

        @colorado_facilities = DmvDataService.new.co_dmv_office_locations
        @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    end

    describe '# initialize' do

        it 'can initialize' do
            expect(@factory).to be_an_instance_of FacilityFactory
        end

    end

    describe '# accurately returns data' do

        it 'create_facilities method returns array of facility objects' do
            new_list = @factory.create_facilities(@colorado_facilities)

            expect(@factory.create_facilities(@colorado_facilities)).to be_a Array

            new_list.each do |list_item|
                expect(list_item).to be_an_instance_of Facility
            end
        end

        # all data sources create facility objects with name, address, and phone number

        describe '# accurately returns data based on location' do

            it 'accurately returns data for Colorado locations' do
                colorado_list = @factory.create_facilities(@colorado_facilities)

                expect(colorado_list[0].name).to eq "DMV Tremont Branch"
                expect(colorado_list[0].address).to eq "2855 Tremont Place Suite 118, Denver, CO 80205"
                expect(colorado_list[0].phone).to eq "(720) 865-4600"
            end

            it 'accurately returns data for New York locations' do
                new_york_list = @factory.create_facilities(@new_york_facilities)

                expect(new_york_list[0].name).to eq "IRONDEQUOIT"
                expect(new_york_list[0].address).to eq "545 TITUS AVENUE, ROCHESTER, NY 14617"
                expect(new_york_list[0].phone).to eq "5857531604"
            end

            it 'accurately returns data for Missouri locations' do
                missouri_list = @factory.create_facilities(@missouri_facilities)

                expect(missouri_list[2].name).to eq "CUBA"
                expect(missouri_list[2].address).to eq "501 S FRANKLIN, CUBA, MO 65453"
                expect(missouri_list[2].phone).to eq "(573) 885-6829"
            end

        end

    end

end