require 'spec_helper'

RSpec.describe Dmv do
  before(:each) do

    @or_locations = DmvDataService.new.or_dmv_office_locations
    @ny_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_locations = DmvDataService.new.mo_dmv_office_locations
  
    @dmv = Dmv.new
    @facility_1 = {name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' }
    @facility_2 = {name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' }
    @facility_3 = {name: 'Bend DMV Office', address: '63030 O B Riley Rd Bend OR 97701', phone: '541-388-6322' }
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
    end
  end

  describe '#add facilities' do
    it 'can add available facilities' do
      
      @or_locations = DmvDataService.new.or_dmv_office_locations
      expect(@dmv.facilities).to eq([])
      @dmv.add_facilities(@or_locations)
      expect(@dmv.facilities[1].address).to eq(@or_locations[1][:location_1])
    end

    it 'can add facilities from Oregon DMV api' do 
      

      expect(@dmv.facilities).to eq([])
      @dmv.add_facilities(@or_locations)

      expect(@dmv.facilities[1]).to be_a(Facility)
      expect(@dmv.facilities[1].name).to eq(@or_locations[1][:title])
      expect(@dmv.facilities[1].address).to eq(@or_locations[1][:location_1])
      expect(@dmv.facilities[1].phone).to eq(@or_locations[1][:phone_number])

    end

    it 'cam add facilities from New York dmv api' do

      expect(@dmv.facilities).to eq([])
      @dmv.add_facilities(@ny_locations)

      expect(@dmv.facilities[1]).to be_a(Facility)
      expect(@dmv.facilities[1].name).to eq(@ny_locations[1][:office_name])
      expect(@dmv.facilities[1].address).to eq(@ny_locations[1][:street_address_line_1])
      expect(@dmv.facilities[1].phone).to eq(@ny_locations[1][:public_phone_number])

    end

  end

  describe '#facilities_offering_service' do
    it 'can return list of facilities offering a specified Service' do
      @dmv.add_facilities([@facility_1, @facility_2, @facility_3])


      
      @dmv.facilities[1].add_service('Vehicle Registration')
      @dmv.facilities[2].add_service('Renew Drivers License')
      @dmv.facilities[1].add_service('New Drivers License')
      @dmv.facilities[1].add_service('Road Test')
      @dmv.facilities[1].add_service('Written Test')
      @dmv.facilities[2].add_service('Road Test')

      @dmv.facilities[1].add_service('New Drivers License')
      
      

      expect(@dmv.facilities_offering_service('Road Test')).to eq(@dmv.facilities[1..2])
    end
  end
end
