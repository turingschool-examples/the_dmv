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

    it "adds services to facilities from CO database" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)
      require "pry"; binding.pry
      expect(factory.facilities[0].services.count).to eq(6)
      expect(factory.facilities[1].services.count).to eq(4)
      expect(factory.facilities[2].services.count).to eq(4)
      expect(factory.facilities[3].services.count).to eq(4)
    end
  end
end