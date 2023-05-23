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
      expect(company[0].address).to eq("2242 Santiam Hwy SE, Albany, OR, 97321")
      expect(company[0].phone).to eq("541-967-2014")
      expect(company[12].address).to eq("749 Riverside Dr, Coquille, OR, 97423, Suite B")
    end
    it 'can create offices from more than one data link' do 
      offices = Office.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      company = offices.create_offices(ny_dmv_office_locations)
      expect(company).to be_an_instance_of(Array)
      expect(company[0]).to be_an_instance_of(Facility)
      expect(company[1].name).to eq('ROCHESTER DOWNTOWN')
      expect(company[6].phone).to eq("3153693301")
      expect(company[1].address).to eq("200 E. MAIN STREET, STE. 101, ROCHESTER NY 14604")
    end
    it 'can create offices from more than two data links' do
      offices = Office.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      company = offices.create_offices(mo_dmv_office_locations)
      expect(company).to be_an_instance_of(Array)
      expect(company[0]).to be_an_instance_of(Facility)
      expect(company[4].name).to eq("LINN LICENSE OFFICE")
      expect(company[6].phone).to eq("(417) 745-6409")
      expect(company[0].address).to eq('3164 TELEGRAPH ROAD, ST LOUIS, MO, 63125')
    end
  end 
end