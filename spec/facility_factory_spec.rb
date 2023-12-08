require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#create_factory' do
    it "create an array of facilities from a given data" do
      factory = FacilityFactory.new
      data = [ {:dmv_office=>"DMV Tremont Branch", :address=>"Suit 118 2855 Tremont Place", :phone=>"(720) 865-4600"},
               {:dmv_office=>"DMV Northeast Branch", :address=>"Suit 101 4685 Peoria Street", :phone=>"(720) 865-4600"} ]

      facilities = factory.create_facilities(data)

      facilities.zip(data) do |facility, facility_data|
        expect(facility).to be_a (Facility)
        expect(facility.name).to eq (facility_data[:dmv_office])
        expect(facility.address).to eq (facility_data[:address])
        expect(facility.phone).to eq (facility_data[:phone])
      end
    end
  end
end
