require 'spec_helper'

RSpec.describe Dmv do
  before(:each) do
    @dmv = Dmv.new
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @facility_3 = Facility.new({name: 'Bend DMV Office', address: '63030 O B Riley Rd Bend OR 97701', phone: '541-388-6322' })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
    end
  end

  describe '#add facilities' do
    it 'can add available facilities' do
      expect(@dmv.facilities).to eq([])
      @dmv.add_facility(@facility_1)
      expect(@dmv.facilities).to eq([@facility_1])
    end
  end

  describe '#facilities_offering_service' do
    it 'can return list of facilities offering a specified Service' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_2.add_service('New Drivers License')
      @facility_2.add_service('Road Test')
      @facility_2.add_service('Written Test')
      @facility_3.add_service('New Drivers License')
      @facility_3.add_service('Road Test')

      @dmv.add_facility(@facility_1)
      @dmv.add_facility(@facility_2)
      @dmv.add_facility(@facility_3)

      expect(@dmv.facilities_offering_service('Road Test')).to eq([@facility_2, @facility_3])
    end
  end

  describe 'Can import facilities' do
    it 'can use external facility data' do
    super_dmv = Dmv.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    super_dmv.add_facilities(new_york_facilities)

    expect(super_dmv.facility_count).to eq(169)
    end

    it 'can use multiple external facility datasets' do
    super_dmv = Dmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    super_dmv.add_facilities(oregon_facilities)
    super_dmv.add_facilities(new_york_facilities)
    super_dmv.add_facilities(missouri_facilities)
      
    expect(super_dmv.facility_count).to eq(169 + 178 + 59)
    end
  end
end
