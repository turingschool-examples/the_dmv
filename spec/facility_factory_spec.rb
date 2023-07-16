require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do
    @colorado_facilities_data = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities_data = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities_data = DmvDataService.new.mo_dmv_office_locations
    @colorado = FacilityFactory.new
    @new_york = FacilityFactory.new
    @missouri = FacilityFactory.new
    end

  describe "#initialize" do
    it "exists"  do 
      expect(@colorado).to be_a FacilityFactory
    end
  end

  describe "#create_facilities" do
    it "can create new colorado facilities" do
      expect(@colorado.facilities_created).to eq([])
      @colorado.create_facilities(@colorado_facilities_data)
      #  require 'pry';binding.pry
      expect(@colorado.facilities_created.size).to eq(@colorado_facilities_data.size)
      expect(@colorado.facilities_created).to all be_a Facility
    end
      
    it "can create new york facilities" do
      expect(@new_york.facilities_created).to eq([])
      @new_york.create_facilities(@new_york_facilities_data)
        # require 'pry';binding.pry
      expect(@new_york.facilities_created.size).to eq(@new_york_facilities_data.size)
      expect(@new_york.facilities_created).to all be_a Facility
    end
    
    it "can create Missouri facilities" do 
      expect(@missouri.facilities_created).to eq([])
      @missouri.create_facilities(@missouri_facilities_data)
        # require 'pry';binding.pry
      expect(@missouri.facilities_created.size).to eq(@missouri_facilities_data.size)
      expect(@missouri.facilities_created).to all be_a Facility
    end 
  end

  describe "#format_facility_name" do 
    it "formats CO facilities names" do 
      random_co_facility_sample = @colorado_facilities_data.sample
      expect(@colorado.format_facility_name(random_co_facility_sample)).to be_a String
      #sample method is great here, but can only check
      # specific_co_facility_sample = {"the_geom":{"type":"Point","coordinates":[-104.97443112500002,39.75525297420336]},"dmv_id":"1","dmv_office":"DMV Tremont Branch","address_li":"2855 Tremont Place","address__1":"Suite 118","city":"Denver","state":"CO","zip":"80205","phone":"(720) 865-4600","hours":"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.","services_p":"vehicle titles, registration, renewals;  VIN inspections","parking_no":"parking available in the lot at the back of the bldg (Glenarm Street)","photo":"images/Tremont.jpg","address_id":"175164",":@computed_region_nku6_53ud":"1444"}
      co_facility_sample_1 = @colorado_facilities_data[0]
      expect(@colorado.format_facility_name(co_facility_sample_1)).to eq("DMV Tremont Branch")
    end
    
    it "formats NY facilities names" do 
      random_ny_facility_sample = @new_york_facilities_data.sample
      expect(@new_york.format_facility_name(random_ny_facility_sample)).to be_a String

      ny_facility_sample_1 = @new_york_facilities_data[0]
      expect(@new_york.format_facility_name(ny_facility_sample_1)).to eq("Jamaica District Office")
      
      ny_facility_sample_2 = @new_york_facilities_data[1]
      expect(@new_york.format_facility_name(ny_facility_sample_2)).to eq("Riverhead Kiosk District Office")
    end
    
    it "formats MO facilities names" do 
      random_mo_facility_sample = @missouri_facilities_data.sample
      expect(@missouri.format_facility_name(random_mo_facility_sample)).to be_a String
  
      mo_facility_sample_1 = @missouri_facilities_data[0]
      expect(@missouri.format_facility_name(mo_facility_sample_1)).to eq("Oakville")
      
      mo_facility_sample_2 = @missouri_facilities_data[1]
      expect(@missouri.format_facility_name(mo_facility_sample_2)).to eq("Clayton")
    end
  end
  
  describe "#format_facility_address" do 
    it "formats CO facilities addresses" do 
      random_co_facility_sample = @colorado_facilities_data.sample
      expect(@colorado.format_facility_address(random_co_facility_sample)).to be_a String
      
      co_facility_sample_1 = @colorado_facilities_data[1]
      expect(@colorado.format_facility_address(co_facility_sample_1)).to eq("4685 Peoria Street Suite 101 Denver CO 80239")
      
      co_facility_sample_2 = @colorado_facilities_data[2]
      expect(@colorado.format_facility_address(co_facility_sample_2)).to eq("3698 W. 44th Avenue Denver CO 80211")
    end
    
    it "formats NY facility addresses" do 
      random_ny_facility_sample = @new_york_facilities_data.sample
      expect(@new_york.format_facility_address(random_ny_facility_sample)).to be_a String
      
      
      ny_facility_sample_1 = @new_york_facilities_data[0]
      expect(@new_york.format_facility_address(ny_facility_sample_1)).to eq("168-46 91st Ave., 2nd Flr Jamaica NY 11432")
    end
    
    it "formats MO facility addresses" do 
      random_mo_facility_sample = @missouri_facilities_data.sample
      expect(@missouri.format_facility_address(random_mo_facility_sample)).to be_a String
    
      mo_facility_sample_1 = @missouri_facilities_data[0]
      expect(@missouri.format_facility_address(mo_facility_sample_1)).to eq("3164 Telegraph Road St Louis MO 63125")
      
      mo_facility_sample_2 = @missouri_facilities_data[1]
      expect(@missouri.format_facility_address(mo_facility_sample_2)).to eq("141 N Meramec Ave, Ste 201 Clayton MO 63105")
    end
  end 

  describe "#format_facility_phone" do 
    it "formats CO facilities phone number" do 
      random_co_facility_sample = @colorado_facilities_data.sample
      expect(@colorado.format_facility_phone(random_co_facility_sample)).to be_a String
      
      co_facility_sample_1 = @colorado_facilities_data[1]
      expect(@colorado.format_facility_phone(co_facility_sample_1)).to eq("(720) 865-4600")
      
      co_facility_sample_2 = @colorado_facilities_data[2]
      expect(@colorado.format_facility_phone(co_facility_sample_2)).to eq("(720) 865-4600")
    end

    it "formats NY facilities phone number" do 
      random_ny_facility_sample = @new_york_facilities_data.sample
      expect(@new_york.format_facility_phone(random_ny_facility_sample)).to be_a String
      
      ny_facility_sample_1 = @new_york_facilities_data[0]
      expect(@new_york.format_facility_phone(ny_facility_sample_1)).to eq("(718) 966-6155")
      
      ny_facility_sample_2 = @new_york_facilities_data[1]
      expect(@new_york.format_facility_phone(ny_facility_sample_2)).to eq("No phone number listed")
    end

    it "formats MO facilities phone number" do 
      random_mo_facility_sample = @missouri_facilities_data.sample
      expect(@missouri.format_facility_phone(random_mo_facility_sample)).to be_a String

      mo_facility_sample_1 = @missouri_facilities_data[0]
      expect(@missouri.format_facility_phone(mo_facility_sample_1)).to eq("(314) 887-1050")

      mo_facility_sample_2 = @missouri_facilities_data[1]
      expect(@missouri.format_facility_phone(mo_facility_sample_2)).to eq("(314) 499-7223")
    end
  end 

  describe "#capitalize_string" do 
    it "capitalizes every word in a string other than state abbreviations" do 
      string_1 = "JAMAICA DISTRICT OFFICE"
      string_2 = "168-46 91ST AVE., 2ND FLR JAMAICA NY 11432"

      expect(@new_york.capitalize_string(string_1)).to eq("Jamaica District Office")
      expect(@new_york.capitalize_string(string_2)).to eq("168-46 91st Ave., 2nd Flr Jamaica NY 11432")
    end
  end

  describe "#format_digits" do 
    it "formats phone numbers to similar format as other states" do 
      number_string_1 = "5184869786"
      number_string_2 = "7189666155"
      nil_digits = nil

      expect(@new_york.format_digits(number_string_1)).to eq("(518) 486-9786")
      expect(@new_york.format_digits(number_string_2)).to eq("(718) 966-6155")
      expect(@new_york.format_digits(nil_digits)).to eq("No phone number listed")
    end
  end
end