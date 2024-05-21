require 'spec_helper'

RSpec.describe FacilityCreator do
  describe 'create_facility' do
    before do
      @facilities_info = [
        { address: '123 Main St', city: 'Anytown', state: 'ST', zip: '12345', phone: '555-1234' },
        { address: '456 Elm St', city: 'Othertown', state: 'ST', zip: '54321', phone: '555-5678' }
      ]
    end

    it 'creates a facility' do    
      facility_creator = FacilityCreator.new

      facilities = facility_creator.create_facilities(@facilities_info)
      expect(facilities).to be_an(Array)

      facilities.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
      end
    end
  end
end
