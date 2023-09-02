require './lib/facility_factory'
require './lib/facility'
require './lib/dmv_data_service'

RSpec.describe do

  it "creates instances of FacilityFactory" do
    factory = FacilityFactory.new

    expect(factory).to be_an_instance_of FacilityFactory
  end

  describe '#create_facilities' do

    it "creates facilities from CO database" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)
      # require "pry"; binding.pry

      expect(factory.facilities.count).to be(5)
      #services stored as one item, need to iterate through services
    end
  end
end