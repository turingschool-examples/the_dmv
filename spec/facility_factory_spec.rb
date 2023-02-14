require 'spec_helper'

RSpec.describe do FacilityFactory
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
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
    it 'create_facility passes New York data to facility class' do
      @facility_1 = Facility.new({name: 'JAMESTOWN', address: '512 WEST 3RD STREET JAMESTOWN NY 14701', phone: '7166618220' })
      @facility_2 = Facility.new({name: 'SARATOGA SPRINGS - WILTON', address: '3065 ROUTE 50 WILTON MALL SARATOGA SPRINGS NY 12866', phone: '5185847403' })
      @created_facilities = @factory.create_facilities_new_york(@new_york_facilities)
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
    it 'create_facility passes Missouri data to facility class' do
      @facility_1 = Facility.new({name: 'SAINTE GENEVIEVE', address: '753 STE. GENEVIEVE DR STE GENEVIEVE MO 63670', phone: '(573) 883-2344' })
      @facility_2 = Facility.new({name: 'OAKVILLE', address: '3164 TELEGRAPH ROAD ST LOUIS MO 63125', phone: '(314) 887-1050' })
      @created_facilities = @factory.create_facilities_missouri(@missouri_facilities)
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
    it '#returns nil if vehicle_database is empty' do
    @factory.create_facilities_oregon(@oregon_facilities)
    @factory.create_facilities_new_york(@new_york_facilities)
    @factory.create_facilities_missouri(@missouri_facilities)

    expect(@factory.create_facilities_oregon([])).to eq nil
    expect(@factory.create_facilities_new_york([])).to eq nil
    expect(@factory.create_facilities_missouri([])).to eq nil
    end 
  end
end