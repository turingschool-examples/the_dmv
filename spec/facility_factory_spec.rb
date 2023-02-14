require 'spec_helper'

RSpec.describe FacilityFactory do
  let(:facility) {FacilityFactory.new}
  let(:or_dmv_office_locations) {DmvDataService.new.or_dmv_office_locations}
  # let(:ny_dmv_office_locations) {DmvDataService.new.ny_dmv_office_locations}
  # require 'pry'; binding.pry

  it 'exists' do
    expect(facility).to be_a(FacilityFactory)
  end

  describe '#facilities' do
    it 'can create facilties from oregon' do
      facility.create_facilities_or(or_dmv_office_locations).each do |facility|
        expect(facility).to be_a Facility
      end
    end

    it 'can create facilties from new york' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      facility.create_facilities_ny(new_york_facilities).each do |facility|
        expect(facility).to be_a Facility
      end
    end

    it 'can create facilities from missouri' do
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      facility.create_facilities_mo(missouri_facilities).each do |facility|
        expect(facility).to be_a Facility
      end
    end

    it 'matches the first facility in the OR data base array' do
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

    it 'matches the first facility in the NY data base array' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      facility_2 = Facility.new({
        :name => "JAMESTOWN",
        :address => '512 WEST 3RD STREET', 
        :phone => "7166618220",
        :services => [], 
        :registered_vehicles => [],
        :collected_fees => 0
      })


      expect(facility.create_facilities_ny(new_york_facilities)[0].name).to eq(facility_2.name)
      expect(facility.create_facilities_ny(new_york_facilities)[0].address).to eq(facility_2.address)
      expect(facility.create_facilities_ny(new_york_facilities)[0].phone).to eq(facility_2.phone)
      expect(facility.create_facilities_ny(new_york_facilities)[0].services).to eq(facility_2.services)
      expect(facility.create_facilities_ny(new_york_facilities)[0].registered_vehicles).to eq(facility_2.registered_vehicles)
      expect(facility.create_facilities_ny(new_york_facilities)[0].collected_fees).to eq(facility_2.collected_fees)
    end

    it 'matches the first facility in the MO data base array' do
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      facility_3 = Facility.new({
        :name => "SAINTE GENEVIEVE ",
        :address => "753 STE. GENEVIEVE DR", 
        :phone => "(573) 883-2344",
        :services => [], 
        :registered_vehicles => [],
        :collected_fees => 0
      })

      expect(facility.create_facilities_mo(missouri_facilities)[0].name).to eq(facility_3.name)
      expect(facility.create_facilities_mo(missouri_facilities)[0].address).to eq(facility_3.address)
      expect(facility.create_facilities_mo(missouri_facilities)[0].phone).to eq(facility_3.phone)
      expect(facility.create_facilities_mo(missouri_facilities)[0].services).to eq(facility_3.services)
      expect(facility.create_facilities_mo(missouri_facilities)[0].registered_vehicles).to eq(facility_3.registered_vehicles)
      expect(facility.create_facilities_mo(missouri_facilities)[0].collected_fees).to eq(facility_3.collected_fees)
    end
  end
end

