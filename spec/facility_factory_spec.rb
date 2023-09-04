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

      expect(factory.facilities.count).to be(5)
    end

    it "adds services to facilities from CO database" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)
      
      expect(factory.facilities[0].services.count).to eq(4)
      expect(factory.facilities[1].services.count).to eq(4)
      expect(factory.facilities[2].services.count).to eq(4)
      expect(factory.facilities[3].services.count).to eq(4)
    end

    it "creates facilities from NY database" do
      factory = FacilityFactory.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      factory.create_facilities(ny_dmv_office_locations)

      expect(factory.facilities.count).to eq(172)
    end

    it "creates facilities from MO database" do
      factory = FacilityFactory.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      factory.create_facilities(mo_dmv_office_locations)

      expect(factory.facilities.count).to eq(178)
    end

  end
  
end