require 'spec_helper'

RSpec.describe FacilityFactory do
  let(:facility) {FacilityFactory.new}
  let(:or_dmv_office_locations) {DmvDataService.new.or_dmv_office_locations}

  it 'exists' do
    expect(facility).to be_a(FacilityFactory)
  end

  describe '#facilities' do
    it 'can create facilties from oregon' do
      facility.create_facilities_or(or_dmv_office_locations).each do |facility|
        expect(facility).to be_a Facility
      end
    end

    it 'matches the first facility in the data base array' do
      facility_1 = Facility.new({
        :name => "Albany DMV Office",
        :address => '2242 Santiam Hwy SE Albany OR 97321', 
        :phone => "541-967-2014",
        :services => [], 
        :registered_vehicles => [],
        :collected_fees => 0
      })

      expect(facility.create_facilities_or(or_dmv_office_locations)[0].name).to eq(facility_1.name)
      expect(facility.create_facilities_or(or_dmv_office_locations)[0].address).to eq(facility_1.address)
      expect(facility.create_facilities_or(or_dmv_office_locations)[0].phone).to eq(facility_1.phone)
      expect(facility.create_facilities_or(or_dmv_office_locations)[0].services).to eq(facility_1.services)
      expect(facility.create_facilities_or(or_dmv_office_locations)[0].registered_vehicles).to eq(facility_1.registered_vehicles)
      expect(facility.create_facilities_or(or_dmv_office_locations)[0].collected_fees).to eq(facility_1.collected_fees)
    end



  end





end