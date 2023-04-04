require "rspec"
require "spec_helper"
require "./lib/facility"
require "./lib/facility_factory"
require "./lib/dmv_data_service"

RSpec.describe FacilityFactory do
  describe "Iteration 3" do
    it "exist" do
      facility_maker = FacilityFactory.new
      
      expect(facility_maker).to be_an_instance_of(FacilityFactory)
    end
    
    context "different factories" do
      it "can make a facility out of NY facilities" do
        facility_maker = FacilityFactory.new
        new_york_facilities_raw_data = DmvDataService.new.ny_dmv_office_locations
        ny_facilities = facility_maker.create_facilities(new_york_facilities_raw_data)
        
        expect(ny_facilities).to be_an(Array)
        expect(ny_facilities[0].name).to eq("SELDEN")
        expect(ny_facilities[0].phone).to be nil
        expect(ny_facilities[0].address).to eq("407 SELDEN RD, SELDEN, NY 11784")
        expect(ny_facilities[0].registered_vehicles).to eq([])
        expect(ny_facilities[0].services).to eq([])
        expect(ny_facilities[0].collected_fees).to eq(0)
        
        expect(ny_facilities[2].name).to eq("SARANAC LAKE")
        expect(ny_facilities[2].phone).to eq("5188911748")
        expect(ny_facilities[2].address).to eq("39 MAIN STREET, SARANAC LAKE, NY 12983")
        expect(ny_facilities[2].registered_vehicles).to eq([])
        expect(ny_facilities[2].services).to eq([])
        expect(ny_facilities[2].collected_fees).to eq(0)
      end

      it "can make a facility out of MO facilities" do
        facility_maker = FacilityFactory.new
        missouri_facilities_raw_data = DmvDataService.new.mo_dmv_office_locations
        mo_facilities = facility_maker.create_facilities(missouri_facilities_raw_data)
        
        expect(mo_facilities).to be_an(Array)
        expect(mo_facilities[0].name).to eq("OAKVILLE")
        expect(mo_facilities[0].phone).to eq("(314) 887-1050")
        expect(mo_facilities[0].address).to eq("3164 TELEGRAPH ROAD, ST LOUIS, MO 63125")
        expect(mo_facilities[0].registered_vehicles).to eq([])
        expect(mo_facilities[0].services).to eq([])
        expect(mo_facilities[0].collected_fees).to eq(0)
        
        expect(mo_facilities[2].name).to eq("LICKING (closed)")
        expect(mo_facilities[2].phone).to be nil
        expect(mo_facilities[2].address).to eq("117A NORTH MAIN, LICKING, MO 65542")
        expect(mo_facilities[2].registered_vehicles).to eq([])
        expect(mo_facilities[2].services).to eq([])
        expect(mo_facilities[2].collected_fees).to eq(0)
      end
    end
  end
end
