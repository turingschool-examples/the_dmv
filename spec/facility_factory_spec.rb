require 'spec_helper'

RSpec.describe FacilityFactory do
  before (:each) do 
    @factory = FacilityFactory.new
    @Colorado = DmvDataService.new.co_dmv_office_locations
    # require 'pry'; binding.pry
  end
  describe '#Facility Factory' do
    it 'shows us Colorado data' do
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facility(@Colorado)
      expect(facilities).to be_a(Array)
      expect(@Colorado[0][:dmv_office]).to be_a(String)
      # expect(@Colorado[0][:]).to be_a(String)
      # expect(facility.create_facility).to be_a(Facility)

    end
  end
end