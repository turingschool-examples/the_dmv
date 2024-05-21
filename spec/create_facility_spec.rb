require 'rspec'
require 'faraday'
require 'json'
require 'facility'
require 'dmv_data_service'

RSpec.describe Facility do
  let(:dmv_data_service) { DmvDataService.new }

  describe '.create_from_data' do
    it 'creates facilities from Colorado data' do
      co_data = dmv_data_service.co_dmv_office_locations
      facilities = Facility.create_from_data(co_data)

      expect(facilities).not_to be_empty
      facilities.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
        expect(facility.name).not_to be_nil
        expect(facility.address).not_to be_nil
        expect(facility.phone).not_to be_nil
      end
    end

    it 'creates facilities from New York data' do
      ny_data = dmv_data_service.ny_dmv_office_locations
      facilities = Facility.create_from_data(ny_data)

      expect(facilities).not_to be_empty
      facilities.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
        expect(facility.name).not_to be_nil
        expect(facility.address).not_to be_nil        
      end
    end

    it 'creates facilities from Missouri data' do
      mo_data = dmv_data_service.mo_dmv_office_locations
      facilities = Facility.create_from_data(mo_data)

      expect(facilities).not_to be_empty
      facilities.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
        expect(facility.name).not_to be_nil
        expect(facility.address).not_to be_nil       
      end
    end
  end
end
