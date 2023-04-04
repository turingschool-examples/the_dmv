require 'spec_helper'

RSpec.describe do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'})
    @new_facility = facility_factory.create_facilities({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  

    it 'exists' do
      expect(@facility_factory).to be_an_instance_of FacilityFactory
      expect(@new_facility[0].name).to eq(@facility_1.name)
      expect(@new_facility[0].address).to eq(@acility_1.address)
      expect(@new_facility[0].phone).to eq(@facility_1.phone)
    end

    it 'creates facilities' do
      expect(@facility_factory.create_facilities(@or_dmv_office_locations)).to be_an_instance_of Array
      expect(@facility_factory.create_facilities(@or_dmv_office_locations)[0]).to be_an_instance_of Facility
    end  

    it 'creates an Oregon facility' do
      or_new_facility = @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

      expect(@facility_factory.create_facilities(@or_dmv_office_locations)).to be_an_instance_of Array
      expect(or_new_facility[0]).to be_an_instance_of(Facility)

    end

    it 'creates a New York facility' do
      ny_new_facility = @new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      expect(@facility_factory.create_facilities(@new_york_facilities)).to be_an_instance_of Array
      expect(ny_new_facility[0]).to be_an_instance_of(Facility)
    end

    it 'creates a Missouri facility' do
      mo_new_facility = @missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(@facility_factory.create_facilities(@missouri_facilitiess)).to be_an_instance_of Array
      expect(mo_new_facility[0]).to be_an_instance_of(Facility)
    end
  end

end