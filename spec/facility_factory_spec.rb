require 'spec_helper'

RSpec.describe do FacilityFactory
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end
  describe '#data to facility class' do
    it 'create_facility passes Oregon data to facility class' do
      @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      @created_facilities = @factory.create_facilities_oregon(@oregon_facilities)
      expect(@created_facilities[0].name).to eq(@facility_1.name)
      expect(@created_facilities[1].name).to eq(@facility_2.name)
      expect(@created_facilities[0].address).to eq(@facility_1.address)
      expect(@created_facilities[1].address).to eq(@facility_2.address)
      expect(@created_facilities[0].phone).to eq(@facility_1.phone)
      expect(@created_facilities[1].phone).to eq(@facility_2.phone)
      expect(@created_facilities[0].services).to eq(@facility_1.services)
      expect(@created_facilities[1].services).to eq(@facility_2.services)
      expect(@created_facilities[0].registered_vehicles).to eq(@facility_1.registered_vehicles)
      expect(@created_facilities[1].registered_vehicles).to eq(@facility_2.registered_vehicles)
      expect(@created_facilities[0].collected_fees).to eq(@facility_1.collected_fees)
      expect(@created_facilities[1].collected_fees).to eq(@facility_2.collected_fees)
    end
    it 'create_facility passes Oregon data to facility class' do
      @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      @created_facilities = @factory.create_facilities_oregon(@oregon_facilities)
      expect(@created_facilities[0].name).to eq(@facility_1.name)
      expect(@created_facilities[1].name).to eq(@facility_2.name)
      expect(@created_facilities[0].address).to eq(@facility_1.address)
      expect(@created_facilities[1].address).to eq(@facility_2.address)
      expect(@created_facilities[0].phone).to eq(@facility_1.phone)
      expect(@created_facilities[1].phone).to eq(@facility_2.phone)
      expect(@created_facilities[0].services).to eq(@facility_1.services)
      expect(@created_facilities[1].services).to eq(@facility_2.services)
      expect(@created_facilities[0].registered_vehicles).to eq(@facility_1.registered_vehicles)
      expect(@created_facilities[1].registered_vehicles).to eq(@facility_2.registered_vehicles)
      expect(@created_facilities[0].collected_fees).to eq(@facility_1.collected_fees)
      expect(@created_facilities[1].collected_fees).to eq(@facility_2.collected_fees)
    end
  end
end