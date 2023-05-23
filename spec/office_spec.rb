require './lib/facility'
require './lib/office'
require './lib/dmv_data_service'

RSpec.describe Office do
  describe '#initialize' do
    it 'can initialize' do
      offices = Office.new
      expect(offices).to be_an_instance_of(Office)
    end
  end
  describe '#create offices from data in link' do
    it 'can create offices' do
      offices = Office.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      company = offices.create_offices(or_dmv_office_locations)
      expect(company).to be_an_instance_of(Array)
      expect(company[0]).to be_an_instance_of(Facility)
      expect(company[1].name).to eq('Ashland DMV Office')
    end
  end 
end