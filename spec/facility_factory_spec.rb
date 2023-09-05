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

  describe 'iteration 4' do 

    it "finds daily hours of Colorado facility" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)
      expect(factory.facilities[0].hours).to eq("Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.")
    end

    it "finds daily hours of New York facility" do
      factory = FacilityFactory.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      factory.create_facilities(ny_dmv_office_locations)
      expect(factory.facilities[0].hours).to eq("Monday: 9:00 AM-5:00 PM; Tuesday: 9:00 AM-5:00 PM; Wednesday: 9:00 AM-5:00 PM; Thursday: 9:00 AM-5:00 PM; Friday: 9:00 AM-5:00 PM; Saturday: -")
    end

    it "finds daily hours of Missouri facility" do
      factory = FacilityFactory.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      factory.create_facilities(mo_dmv_office_locations)
      expect(factory.facilities[0].hours).to eq("Monday-Friday - 9:00 to 5:00, Last Saturday  - 9:00 to 12:00")
    end

    it "finds which holidays the MO facility is closed" do
      factory = FacilityFactory.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      factory.create_facilities(mo_dmv_office_locations)
      expect(factory.facilities[0].closed).to eq("Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), President’s Day (02/20/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")
    end
  end
end