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

  describe '#create_oregon_facilities' do
    it 'creates Facility objects with correct addresses' do
      or_dmv = Dmv.new
      or_dmv.create_oregon_facilities

      facilities = or_dmv.facilities

      expect(facilities.size).to eq(59)

      facility1 = facilities[0]
      expect(facility1.name).to eq('Albany DMV Office')
      expect(facility1.address).to eq('2242 Santiam Hwy SE, Albany, OR, 97321')
      expect(facility1.phone).to eq('541-967-2014')

      facility2 = facilities[1]
      expect(facility2.name).to eq('Ashland DMV Office')
      expect(facility2.address).to eq('600 Tolman Creek Rd, Ashland, OR, 97520')
      expect(facility2.phone).to eq('541-776-6092')
    end
  end

  describe '#create_new_york_facilities' do
    it 'creates Facility objects with correct addresses' do
      dmv = Dmv.new
      dmv.create_new_york_facilities

      facilities = dmv.facilities

      expect(facilities.size).to eq(172)

      facility1 = facilities[0]
      expect(facility1.name).to eq('Jamaica Kiosk')
      expect(facility1.address).to eq('168-46 91st Ave., 2nd Flr, Jamaica, Ny, 11432')
      expect(facility1.phone).to eq(nil)

      facility2 = facilities[1]
      expect(facility2.name).to eq('Rochester Downtown')
      expect(facility2.address).to eq('200 E. Main Street, Rochester, Ny, 14604')
      expect(facility2.phone).to eq('5857531604')

      facility3 = facilities[2]
      expect(facility3.name).to eq('Millbrook')
      expect(facility3.address).to eq('15 Merritt Avenue, Millbrook, Ny, 12545')
      expect(facility3.phone).to eq('8456774080')
    end
  end

end
