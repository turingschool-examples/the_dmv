require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#create_factory' do
    it 'create an array of facilities from a given data' do
      factory = FacilityFactory.new
      data = [
              {:dmv_office=>"DMV Tremont Branch", :address=>"Suit 118 2855 Tremont Place", :phone=>"(720) 865-4600", :daysopen=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m."},
              {:dmv_office=>"DMV Northeast Branch", :address=>"Suit 101 4685 Peoria Street", :phone=>"(720) 865-4600", :daysopen=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m."}
             ]

      facilities = factory.create_facilities(data, :dmv_office, :address, :phone, :daysopen)

      facilities.zip(data) do |facility, facility_data|
        expect(facility).to be_a (Facility)
        expect(facility.name).to eq (facility_data[:dmv_office])
        expect(facility.address).to eq (facility_data[:address])
        expect(facility.phone).to eq (facility_data[:phone])
        expect(facility.daily_hours).to eq (facility_data[:daysopen])
      end
    end
  end

  describe '#daily_hours_ny' do
    it 'create daily hours for NY facilities' do
      factory = FacilityFactory.new
      facility_data  =
                { :monday_beginning_hours=>"8:30 AM",
                  :monday_ending_hours=>"4:30 PM",
                  :tuesday_beginning_hours=>"8:30 AM",
                  :tuesday_ending_hours=>"4:30 PM",
                  :wednesday_beginning_hours=>"8:30 AM",
                  :wednesday_ending_hours=>"4:30 PM",
                  :thursday_beginning_hours=>"8:30 AM",
                  :thursday_ending_hours=>"4:30 PM",
                  :friday_beginning_hours=>"8:30 AM",
                  :friday_ending_hours=>"4:30 PM",
                  :saturday_beginning_hours=>"CLOSED",
                  :saturday_ending_hours=>"CLOSED"
                }

      daily_hours = factory.daily_hours_ny(facility_data)

      expect(daily_hours).to eq ["M, T, W, Th, F: 8:30 AM-4:30 PM", "SAT: CLOSED"]
    end
  end

  describe "#holidays_closed" do
    it "return holidays that facilities in MO are closed" do
      factory = FacilityFactory.new
      mo_data = [
                  { :holidaysclosed=>"Independence Day (07/04/22), Labor Day (09/05/22)" },
                  { :holidaysclosed=>"Thanksgiving (11/24/22), Christmas Day Observed (12/26/22)" }
                ]

      expect(factory.holidays_closed(mo_data)).to eq (["Independence Day (07/04/22), Labor Day (09/05/22)", "Thanksgiving (11/24/22), Christmas Day Observed (12/26/22)"])
    end
  end
end
