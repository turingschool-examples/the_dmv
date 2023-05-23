require 'spec_helper'

RSpec.describe FacilityFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
      oregon_facilities = DmvDataService.new.or_dmv_office_locations

      expect(oregon_facilities).to be_a(Array)
      expect(oregon_facilities[0]).to be_a(Hash)
      expect(oregon_facilities[0][:title]).to be_a(String)
      expect(oregon_facilities[0][:location_1]).to be_a(Hash)
    end
  end
  describe `#create_oregon_facility` do
    it 'can create facility objects from oregon dmv data' do
      factory = FacilityFactory.new
      oregon_facilities = DmvDataService.new.or_dmv_office_locations
      
      expect(factory.create_oregon_facility(oregon_facilities)[0]).to be_a(Facility)
      expect(factory.create_oregon_facility(oregon_facilities)[0].address).to be_a(String)
      expect(factory.create_oregon_facility(oregon_facilities)).to be_a(Array)
    end
  end
end  










#     it 'can create facility objects from multiple data sources' do
#       factory = FacilityFactory.new
#       oregon_facilities = DmvDataService.new.or_dmv_office_locations
#       new_york_facilities = DmvDataService.new.ny_dmv_office_locations
#       missouri_facilities = DmvDataService.new.mo_dmv_office_locations

#       expect(factory.create_facility(oregon_facilities)[0]).to be_a(Facility)
#       # expect(factory.create_facility(new_york_facilities)[0]).to be_a(Facility)
#       # expect(factory.create_facility(missouri_facilities)[0]).to be_a(Facility)

#     end

#   describe '#facility_name' do
#     xit 'matches facility object name to dmv name' do

#     end
#   end
# end