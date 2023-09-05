require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#normalize_phone' do
    it 'will normalize a unnormalized phone number to the output (555) 555-5555' do
      number = '1234567890'
      
      expect(@factory.normalize_phone(number)).to eq('(123) 456-7890')
    end

    it 'will not change an already normalized number' do
      number = '(123) 456-7890'

      expect(@factory.normalize_phone(number)).to eq('(123) 456-7890')
    end
  end
  
  describe '#create_facilities' do
    it 'will create Facility objects from a location dataset (CO)' do
      @factory.create_facilities(@co_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)
      end

      expect(@factory.create_facilities(@co_dmv_office_locations)[0].name).to eq('DMV Tremont Branch')
      expect(@factory.create_facilities(@co_dmv_office_locations)[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@factory.create_facilities(@co_dmv_office_locations)[0].phone).to eq('(720) 865-4600')
    end

    it 'will create Facility objects from a different location datase (NY)' do
      @factory.create_facilities(@ny_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)

        expect(@factory.create_facilities(@ny_dmv_office_locations)[0].name).to eq('EVANS')
        expect(@factory.create_facilities(@ny_dmv_office_locations)[0].address).to eq('6853 ERIE RD DERBY NY 14006')
        expect(@factory.create_facilities(@ny_dmv_office_locations)[0].phone).to eq('(716) 858-7450')
      end
    end

    it 'will create Facility objects from another different location dataset (MO)' do
      @factory.create_facilities(@mo_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)
      end

      expect(@factory.create_facilities(@mo_dmv_office_locations)[0].name).to eq('OAKVILLE')
      expect(@factory.create_facilities(@mo_dmv_office_locations)[0].address).to eq('3164 TELEGRAPH ROAD ST LOUIS MO 63125')
      expect(@factory.create_facilities(@mo_dmv_office_locations)[0].phone).to eq('(314) 887-1050')
    end
  end
end