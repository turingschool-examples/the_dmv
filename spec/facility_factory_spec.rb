require 'rspec'
require 'json'
require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#initialize' do
    it 'exists' do
      facility_factory = FacilityFactory.new

      expect(facility_factory).to be_a(FacilityFactory)
      expect(facility_factory.new_facilities).to eq([])
    end
  end

  describe '#create_facility' do
    it 'can create a facility' do
      facility_factory = FacilityFactory.new
      facility1 = {:name=>'Test', :address=>'123 Spring St', :phone=>'(555)123-0987'}
      facility2 = {:name=>'Test2', :address=>'456 Spruce Ave', :phone=>'(555)465-2049'}
      expect(facility_factory.create_facility(facility1)[0]).to be_a(Facility)
      expect(facility_factory.new_facilities[0].name).to eq('Test')
      expect(facility_factory.new_facilities[0].address).to eq('123 Spring St')
      expect(facility_factory.new_facilities[0].phone).to eq('(555)123-0987')
      expect(facility_factory.new_facilities.size).to eq(1)
      expect(facility_factory.create_facility(facility2)[0]).to be_a(Facility)
      expect(facility_factory.new_facilities[1].name).to eq('Test2')
      expect(facility_factory.new_facilities[1].address).to eq('456 Spruce Ave')
      expect(facility_factory.new_facilities[1].phone).to eq('(555)465-2049')
      expect(facility_factory.new_facilities.size).to eq(2)
    end
  end

  describe '#create_facilities' do
    it 'can create multiple facilities at once (from OR)' do
      facility_factory = FacilityFactory.new
      new_locations_or = DmvDataService.new.or_dmv_office_locations
      facility_factory.create_or_facilities(new_locations_or)
      expect(facility_factory.new_facilities.length).to eq(59)
      expect(facility_factory.new_facilities[0]).to be_a(Facility)
      expect(facility_factory.new_facilities[0].name).to eq('Albany DMV Office')
      expect(facility_factory.new_facilities[0].phone).to eq('541-967-2014')
      expect(facility_factory.new_facilities[1]).to be_a(Facility)
      expect(facility_factory.new_facilities[1].name).to eq('Ashland DMV Office')
      expect(facility_factory.new_facilities[1].phone).to eq('541-776-6092')
      expect(facility_factory.new_facilities[2]).to be_a(Facility)
      expect(facility_factory.new_facilities[2].name).to eq('Astoria DMV Office')
      expect(facility_factory.new_facilities[2].phone).to eq('503-325-3951')
    end

    it 'can create multiple facilities at once (from NY)' do
      facility_factory = FacilityFactory.new
      new_locations_ny = DmvDataService.new.ny_dmv_office_locations
      new_locations_mo = DmvDataService.new.mo_dmv_office_locations
      facility_factory.create_ny_facilities(new_locations_ny)
      expect(facility_factory.new_facilities.length).to eq(169)
      expect(facility_factory.new_facilities[0]).to be_a(Facility)
      expect(facility_factory.new_facilities[0].name).to eq('JAMESTOWN')
      expect(facility_factory.new_facilities[0].phone).to eq('7166618220')
      expect(facility_factory.new_facilities[1]).to be_a(Facility)
      expect(facility_factory.new_facilities[1].name).to eq('SARATOGA SPRINGS - WILTON')
      expect(facility_factory.new_facilities[1].phone).to eq('5185847403')
      expect(facility_factory.new_facilities[2]).to be_a(Facility)
      expect(facility_factory.new_facilities[2].name).to eq('MONROE COUNTY EASTSIDE MOBILE OFFICE')
      expect(facility_factory.new_facilities[2].phone).to eq('5857531604')
    end

    it 'can create multiple facilities at once (from MO)'do
      facility_factory = FacilityFactory.new
      new_locations_mo = DmvDataService.new.mo_dmv_office_locations
      facility_factory.create_mo_facilities(new_locations_mo)
      expect(facility_factory.new_facilities.length).to eq(178)
      expect(facility_factory.new_facilities[0]).to be_a(Facility)
      expect(facility_factory.new_facilities[0].name).to eq('SAINTE GENEVIEVE ')
      expect(facility_factory.new_facilities[0].phone).to eq('(573) 883-2344')
      expect(facility_factory.new_facilities[1]).to be_a(Facility)
      expect(facility_factory.new_facilities[1].name).to eq('OAKVILLE')
      expect(facility_factory.new_facilities[1].phone).to eq('(314) 887-1050')
      expect(facility_factory.new_facilities[2]).to be_a(Facility)
      expect(facility_factory.new_facilities[2].name).to eq('CLAYTON ')
      expect(facility_factory.new_facilities[2].phone).to eq('(314) 499-7223')
    end
  end

  describe '#create_state_facilities' do
    it 'can differentiate between different states' do
      facility_factory = FacilityFactory.new
      new_locations_or = DmvDataService.new.or_dmv_office_locations
      new_locations_ny = DmvDataService.new.ny_dmv_office_locations
      new_locations_mo = DmvDataService.new.mo_dmv_office_locations
      
      expect(facility_factory.create_facilities('ca')).to eq('State unavailable!')
      expect(facility_factory.create_facilities('or', new_locations_or)).to be_a(Facility)
      expect(facility_factory.create_facilities('ny', new_locations_ny)).to be_a(Facility)
      expect(facility_factory.create_facilities('mo', new_locations_mo)).to be_a(Facility)
    end
  end
end