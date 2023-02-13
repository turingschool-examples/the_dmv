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

  describe '#determine state' do
    it 'can determine state oregon' do
      dmv = Dmv.new
      oregon_facilities = DmvDataService.new.or_dmv_office_locations
      dmv.determine_state(oregon_facilities)

      expect(dmv.state).to eq("Oregon")
    end

    it 'can determine state new york' do
      dmv = Dmv.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      dmv.determine_state(new_york_facilities)

      expect(dmv.state).to eq("New York")
    end

  end

  describe '#render data' do
    it 'can convert OR data into useable info' do
      oregon_dmv = Dmv.new
      oregon_facilities = DmvDataService.new.or_dmv_office_locations

      oregon_dmv.render_facility_data_or(oregon_facilities)
      
      expect(oregon_dmv.rendered_facilities.first).to be_a Hash
      expect(oregon_dmv.rendered_facilities.first[:name]).to eq("Albany DMV Office")
      expect(oregon_dmv.rendered_facilities.first[:phone]).to eq("541-967-2014")
      expect(oregon_dmv.rendered_facilities.first[:address]).to eq("2242 Santiam Hwy SE Albany OR 97321")
    end

    it 'can convert NY data into useable info' do
      new_york_dmv = Dmv.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      new_york_dmv.render_facility_data_ny(new_york_facilities)
      
      
      expect(new_york_dmv.rendered_facilities.first).to be_a Hash
      expect(new_york_dmv.rendered_facilities.first[:name]).to eq("JAMESTOWN COUNTY OFFICE")
      expect(new_york_dmv.rendered_facilities.first[:phone]).to eq("7166618220")
      expect(new_york_dmv.rendered_facilities.first[:address]).to eq("512 WEST 3RD STREET JAMESTOWN NY 14701")
      # require 'pry'; binding.pry

    end
  end

  # describe '#create facilities from external data' do
  #   it 'can create new facilities from oregon' do
  #     oregon_dmv = Dmv.new
  #     oregon_facilities = DmvDataService.new.or_dmv_office_locations

  #     oregon_dmv.create_facilities(oregon_facilities)

  #     expect(oregon_dmv.facilities.first).to be_an_instance_of Facility
  #   end
  # end

end
