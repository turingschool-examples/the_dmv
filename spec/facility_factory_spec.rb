require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end

  # describe '#normalize_phone' do
  #   it 'will normalize a phone number to the output (555) 555-5555' do
  #     number = 1234567890
      
  #     expect(normalize_phone(number)).to eq("(123) 456-7890")
  #   end

  #   # if this method is used, may have to make all other phone numbers into strings
  #   it 'will output the same number if fed an already normalized number' do
  #     number = "(123) 456-7890"

  #     expect(normalize_phone(number)).to eq("(123) 456-7890")
  #   end
  # end

  # describe '#filter_co' do
  #   it 'can create Facility objects from CO state data' do
      
  #   end
  # end

  describe '#create_facilities' do
    it 'will create Facility objects from a location dataset (CO)' do
      @factory.create_facilities(@co_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)
      end
    end

    it 'will create Facility objects from a different location datase (NY)' do
      @factory.create_facilities(@ny_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)
      end
    end

    it 'will create Facility objects from another different location dataset (MO)' do
      @factory.create_facilities(@mo_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)
      end
    end
  end
end