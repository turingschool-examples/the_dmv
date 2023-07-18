require './lib/dmv'
require './lib/facility'
require './lib/facilty_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do 
  it 'exists' do
    facility = FacilityFactory.new

    expect(facility).to be_a FacilityFactory
  end

  describe '#create_facility' do 
    it 'exists' do 
      facility = Facility.new
        co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        
        
  
        expect(factory.vehicles).to be_an Array
  
  
      end
    end
  end
end