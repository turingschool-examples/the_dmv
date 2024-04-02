require 'spec_helper'

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    end

    describe 'loads data' do
        it 'loads CO DMV data' do
            expect(@co_dmv_office_locations).to be_an_instance_of(Array)
        end

        it 'loads NY DMV data' do
            expect(@new_york_facilities).to be_an_instance_of(Array)
        end

        it 'loads MO DMV data' do
            expect(@missouri_facilities).to be_an_instance_of(Array)
        end
    end

    describe '#initialize' do
        it 'exists' do
            expect(@factory).to be_an_instance_of(FacilityFactory)
        end
    end

    describe '#create_facilities' do
        describe 'creating CO facilities' do
            it 'can use data to create new CO DMV Facility instances' do
                facilities = @factory.create_facilities(@co_dmv_office_locations)

                expect(facilities).to be_an_instance_of(Array)
                expect(facilities.size).to be_an(Integer)
                expect(facilities.first).to be_an_instance_of(Facility)
                expect(facilities.last).to be_an_instance_of(Facility)
            end

            it 'creates proper name for the CO DMV Facility instances' do
                first_facility = @factory.create_facilities(@co_dmv_office_locations).first

                expect(first_facility.name).not_to eq(nil)
                expect(first_facility.name).to be_a(String)
                expect(first_facility.name).to eq('DMV Tremont Branch')
            end

            it 'creates proper address for the CO DMV Facility instances' do
                first_facility = @factory.create_facilities(@co_dmv_office_locations).first

                expect(first_facility.address).not_to eq(nil)
                expect(first_facility.address).to be_a(String)
                expect(first_facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
            end

            it 'creates proper phone number for the CO DMV Facility instances' do
                first_facility = @factory.create_facilities(@co_dmv_office_locations).first

                expect(first_facility.phone).not_to eq(nil)
                expect(first_facility.phone).to be_a(String)
                expect(first_facility.phone).to eq('(720) 865-4600')
            end

            it 'creates proper daily hours for the CO DMV Facility instances' do
                first_facility = @factory.create_facilities(@co_dmv_office_locations).first

                expect(first_facility.hours).not_to eq(nil)
                expect(first_facility.hours).to be_a(String)
                expect(first_facility.hours).to eq('Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.')
            end
        end

        describe 'creating NY facilities' do
            it 'can use data to create new NY DMV Facility instances' do
                facilities = @factory.create_facilities(@new_york_facilities)

                expect(facilities).to be_an_instance_of(Array)
                expect(facilities.size).to be_an(Integer)
                expect(facilities.first).to be_an_instance_of(Facility)
                expect(facilities.last).to be_an_instance_of(Facility)
            end

            it 'creates proper name for the NY DMV Facility instances' do
                first_facility = @factory.create_facilities(@new_york_facilities).first

                expect(first_facility.name).not_to eq(nil)
                expect(first_facility.name).to be_a(String)
                expect(first_facility.name).to eq('JAMAICA')
            end

            it 'creates proper address for the NY DMV Facility instances' do
                first_facility = @factory.create_facilities(@new_york_facilities).first

                expect(first_facility.address).not_to eq(nil)
                expect(first_facility.address).to be_a(String)
                expect(first_facility.address).to eq('168-46 91ST AVE., 2ND FLR  JAMAICA NY 11432')
            end

            it 'creates proper phone number for the NY DMV Facility instances' do
                first_facility = @factory.create_facilities(@new_york_facilities).first

                expect(first_facility.phone).not_to eq(nil)
                expect(first_facility.phone).to be_a(String)
                expect(first_facility.phone).to eq('7189666155')
            end

            it 'creates proper daily hours for the NY DMV Facility instances' do
                first_facility = @factory.create_facilities(@new_york_facilities).first

                expect(first_facility.hours).not_to eq(nil)
                expect(first_facility.hours).to be_a(String)
                expect(first_facility.hours).to eq('Weekdays: 7:30 AM - 5:00 PM, Closed Saturdays and Sundays')
            end
        end

        describe 'creating MO facilities' do
            it 'can use data to create new MO DMV Facility instances' do
                facilities = @factory.create_facilities(@missouri_facilities)

                expect(facilities).to be_an_instance_of(Array)
                expect(facilities.size).to be_an(Integer)
                expect(facilities.first).to be_an_instance_of(Facility)
                expect(facilities.last).to be_an_instance_of(Facility)
            end

            it 'creates proper name for the MO DMV Facility instances' do
                first_facility = @factory.create_facilities(@missouri_facilities).first

                expect(first_facility.name).not_to eq(nil)
                expect(first_facility.name).to be_a(String)
                expect(first_facility.name).to eq('NEVADA')
            end

            it 'creates proper address for the MO DMV Facility instances' do
                first_facility = @factory.create_facilities(@missouri_facilities).first

                expect(first_facility.address).not_to eq(nil)
                expect(first_facility.address).to be_a(String)
                expect(first_facility.address).to eq('409 E AUSTIN BLVD  NEVADA MO 64772')
            end

            it 'creates proper phone number for the MO DMV Facility instances' do
                first_facility = @factory.create_facilities(@missouri_facilities).first

                expect(first_facility.phone).not_to eq(nil)
                expect(first_facility.phone).to be_a(String)
                expect(first_facility.phone).to eq('(417) 448-5705')
            end

            it 'creates proper daily hours for the MO DMV Facility instances' do
                first_facility = @factory.create_facilities(@missouri_facilities).first
                
                expect(first_facility.hours).not_to eq(nil)
                expect(first_facility.hours).to be_a(String)
            end
        end
    end

    describe '#format_address' do
        it 'has proper formatting for addresses' do
            expected = 'address_1 address_2 city state zip'
            expect(@factory.format_address('address_1', 'address_2', 'city', 'state', 'zip')).to eq(expected)
        end
    end

    describe '#format_ny_hours' do
        it 'has proper formatting for NY hours' do
            expected = 'Weekdays: 7:30 AM - 5:00 PM, Closed Saturdays and Sundays'
            expect(@factory.format_ny_hours('7:30 AM', '5:00 PM')).to eq(expected)
        end
    end

    describe '#format_mo_hours' do
        it 'has proper formatting for MO hours and holidays closed' do
            expected = "Hours Open: Monday - Friday - 8:00 to 5:00, Last Saturday of the Month  - 8:00 to 12:00, Closed: Monday - Friday from 1:00 to 1:30, HOLIDAYS CLOSED: Christmas Day (12/25/23), New Year's Day (1/1/24), 
            Martin Luther King Jr. Day (1/15/24), Lincoln's Birthday (2/12/24), President's Day (2/19/24), 
            Truman's Birthday (5/8/24), Memorial Day (5/27/24), Juneteenth (6/19/24), Independence Day (7/4/24), 
            Labor Day (9/2/24), Columbus Day (10/14/24), Veterans Day (11/11/24), Thanksgiving Day (11/28/24), 
            Christmas Day (12/25/24)"

            expect(@factory.format_mo_hours("Monday - Friday - 8:00 to 5:00, Last Saturday of the Month  - 8:00 to 12:00", 
            "Monday - Friday from 1:00 to 1:30", "Christmas Day (12/25/23), New Year's Day (1/1/24), 
            Martin Luther King Jr. Day (1/15/24), Lincoln's Birthday (2/12/24), President's Day (2/19/24), 
            Truman's Birthday (5/8/24), Memorial Day (5/27/24), Juneteenth (6/19/24), Independence Day (7/4/24), 
            Labor Day (9/2/24), Columbus Day (10/14/24), Veterans Day (11/11/24), Thanksgiving Day (11/28/24), 
            Christmas Day (12/25/24)")).to eq(expected)
        end
    end
end