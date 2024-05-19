require 'spec_helper'

RSpec.describe FacilityGenerator do
  before(:each) do
    @fg = FacilityGenerator.new
    @co = DmvDataService.new.co_dmv_office_locations
    @ny = DmvDataService.new.ny_dmv_office_locations
    @mo = DmvDataService.new.mo_dmv_office_locations
    
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@fg).to be_an_instance_of(FacilityGenerator)
    end
  end

  describe '#create_facility' do
    it 'can create a facility' do
      expect(@fg.create_facility(@co)).to be_an_instance_of(Array)
    end
  end
  describe '#co_facility' do
    it 'can create a CO facility and create a new instance of facility' do
      
      expect(@fg.co_facility(@co[0])).to be_an_instance_of(Facility)
      expect(@fg.co_facility(@co[0]).name).to eq("DMV Tremont Branch")
      expect(@fg.co_facility(@co[0]).address).to eq("2855 Tremont Place, Suite 118, Denver, CO 80205")
      expect(@fg.co_facility(@co[0]).phone).to eq("(720) 865-4600")
    end

    describe '#ny_facility' do
      it 'can create a NY facility and create a new instance of facility' do
        expect(@fg.ny_facility(@ny[0])).to be_an_instance_of(Facility)
        expect(@fg.ny_facility(@ny[0]).name).to eq("IRONDEQUOIT")
        expect(@fg.ny_facility(@ny[0]).address).to eq("545 TITUS AVENUE, ROCHESTER, NY 14617")
        expect(@fg.ny_facility(@ny[0]).phone).to eq("5857531604")
      end
    end
  end
end