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
      
      expect(@colorado.facilities_created.size).to eq(@colorado_facilities_data.size)
      expect(@colorado.facilities_created).to all be_a Facility
    end
      
    it "can create new york facilities" do
      expect(@new_york.facilities_created).to eq([])
      @new_york.create_facilities(@new_york_facilities_data)
  
      expect(@new_york.facilities_created.size).to eq(@new_york_facilities_data.size)
      expect(@new_york.facilities_created).to all be_a Facility
    end
    
    it "can create Missouri facilities" do 
      expect(@missouri.facilities_created).to eq([])
      @missouri.create_facilities(@missouri_facilities_data)
      
      expect(@missouri.facilities_created.size).to eq(@missouri_facilities_data.size)
      expect(@missouri.facilities_created).to all be_a Facility
    end 
  end

  describe "#format_facility_name" do 
    it "formats CO facilities names" do 
      random_co_facility_sample = @colorado_facilities_data.sample
      expect(@colorado.format_facility_name(random_co_facility_sample)).to be_a String

      co_facility_name_1 = {:state=> "CO", :dmv_office=>"DMV Tremont Branch"}
      expect(@colorado.format_facility_name(co_facility_name_1)).to eq("DMV Tremont Branch")

      co_facility_name_2 = {:state=> "CO", :dmv_office=>"DMV Northeast Branch"}
      expect(@colorado.format_facility_name(co_facility_name_2)).to eq("DMV Northeast Branch")
    end
    
    it "formats NY facilities names" do 
      random_ny_facility_sample = @new_york_facilities_data.sample
      expect(@new_york.format_facility_name(random_ny_facility_sample)).to be_a String

      ny_facility_name_1 = {:state=>"NY", :office_name=>"JAMAICA", :office_type=>"DISTRICT OFFICE"}
      expect(@new_york.format_facility_name(ny_facility_name_1)).to eq("DMV Jamaica District Office")
      
      ny_facility_name_2 = {:state=>"NY", :office_name=>"RIVERHEAD KIOSK", :office_type=>"DISTRICT OFFICE"}
      expect(@new_york.format_facility_name(ny_facility_name_2)).to eq("DMV Riverhead Kiosk District Office")
    end
    
    it "formats MO facilities names" do 
      random_mo_facility_sample = @missouri_facilities_data.sample
      expect(@missouri.format_facility_name(random_mo_facility_sample)).to be_a String
  
      mo_facility_name_1 = {:state=>"MO", :name=>"DEXTER" }
      expect(@missouri.format_facility_name(mo_facility_name_1)).to eq("DMV Dexter")
      
      mo_facility_name_2 = {:state=>"MO", :name=>"OAKVILLE"}
      expect(@missouri.format_facility_name(mo_facility_name_2)).to eq("DMV Oakville")
    end
  end
  
  describe "#format_facility_address" do 
    it "formats CO facilities addresses" do 
      random_co_facility_sample = @colorado_facilities_data.sample
      expect(@colorado.format_facility_address(random_co_facility_sample)).to be_a String
      
      co_facility_address_1 = {:address_li=>"4685 Peoria Street", :address__1=>"Suite 101", :location=>"Arie P. Taylor  Municipal Bldg", :city=>"Denver", :state=>"CO", :zip=>"80239"}
      expect(@colorado.format_facility_address(co_facility_address_1)).to eq("4685 Peoria Street Suite 101 Denver CO 80239")
      
      co_facility_address_2 = {:address_li=>"3698 W. 44th Avenue", :location=>"Safeway Plaza", :city=>"Denver", :state=>"CO", :zip=>"80211"}
      expect(@colorado.format_facility_address(co_facility_address_2)).to eq("3698 W. 44th Avenue Denver CO 80211")
    end
    
    it "formats NY facility addresses" do 
      random_ny_facility_sample = @new_york_facilities_data.sample
      expect(@new_york.format_facility_address(random_ny_facility_sample)).to be_a String
      
      ny_facility_address_1 = {:street_address_line_1=>"168-46 91ST AVE., 2ND FLR", :city=>"JAMAICA", :state=>"NY", :zip_code=>"11432" }
      expect(@new_york.format_facility_address(ny_facility_address_1)).to eq("168-46 91st Ave., 2nd Flr Jamaica NY 11432")

      ny_facility_address_2 = {:street_address_line_1=>"200 OLD COUNTRY ROAD", :city=>"RIVERHEAD", :state=>"NY", :zip_code=>"11901"}
      expect(@new_york.format_facility_address(ny_facility_address_2)).to eq("200 Old Country Road Riverhead NY 11901")
    end
    
    it "formats MO facility addresses" do 
      random_mo_facility_sample = @missouri_facilities_data.sample
      expect(@missouri.format_facility_address(random_mo_facility_sample)).to be_a String
    
      mo_facility_address_1 = {:address1=>"119 VINE ST", :city=>"DEXTER", :state=>"MO", :zipcode=>"63841", }
      expect(@missouri.format_facility_address(mo_facility_address_1)).to eq("119 Vine St Dexter MO 63841")
      
      mo_facility_address_2 = {:address1=>"141 N Meramec Ave, Ste 201", :city=>"CLAYTON", :state=>"MO", :zipcode=>"63105"}
      expect(@missouri.format_facility_address(mo_facility_address_2)).to eq("141 N Meramec Ave, Ste 201 Clayton MO 63105")
    end
  end 

  describe "#format_facility_phone" do 
    it "formats CO facilities phone number" do 
      random_co_facility_sample = @colorado_facilities_data.sample
      expect(@colorado.format_facility_phone(random_co_facility_sample)).to be_a String
      
      co_phone_number_1 = {:state=>"CO",:phone =>"720-865-4600"}
      expect(@colorado.format_facility_phone(co_phone_number_1)).to eq("(720) 865-4600")
      
      co_phone_number_2 = {:state=> "CO", :phone=> "7208654600"}
      expect(@colorado.format_facility_phone(co_phone_number_2)).to eq("(720) 865-4600")
    end

    it "formats NY facilities phone number" do 
      random_ny_facility_sample = @new_york_facilities_data.sample
      expect(@new_york.format_facility_phone(random_ny_facility_sample)).to be_a String
      
      ny_phone_number_1 = {:state=> "NY", :public_phone_number=>"7189666155"}
      expect(@new_york.format_facility_phone(ny_phone_number_1)).to eq("(718) 966-6155")
      
      ny_phone_number_2 = {:state=> "NY"}
      expect(@new_york.format_facility_phone(ny_phone_number_2)).to eq("No phone number listed")
    end

    it "formats MO facilities phone number" do 
      random_mo_facility_sample = @missouri_facilities_data.sample
      expect(@missouri.format_facility_phone(random_mo_facility_sample)).to be_a String

      mo_phone_number_1 = {:state=> "MO", :phone=>"5736248808"}
      expect(@missouri.format_facility_phone(mo_phone_number_1)).to eq("(573) 624-8808")

      mo_phone_number_2 = {:state=> "MO", :phone=>"3144997223"}
      expect(@missouri.format_facility_phone(mo_phone_number_2)).to eq("(314) 499-7223")
    end
  end 

  describe "#capitalize_string" do 
    it "capitalizes every word in a string other than state abbreviations" do 
      office_string_1 = "DMV JAMAICA DISTRICT OFFICE"
      expect(@new_york.capitalize_string(office_string_1)).to eq("DMV Jamaica District Office")

      office_string_2 = "DMV CLAYTON"
      expect(@missouri.capitalize_string(office_string_2)).to eq("DMV Clayton")

      address_string_1 = "168-46 91ST AVE., 2ND FLR JAMAICA NY 11432"
      expect(@new_york.capitalize_string(address_string_1)).to eq("168-46 91st Ave., 2nd Flr Jamaica NY 11432")

      address_string_2 = "11977 ST. CHARLES ROCK ROAD SUITE 111 BRIDGETON MO 63044"
      expect(@missouri.capitalize_string(address_string_2)).to eq("11977 St. Charles Rock Road Suite 111 Bridgeton MO 63044")
    end
  end

  describe "#format_digits" do 
    it "formats phone numbers to similar format as other states" do 
      phone_number_1 = "5184869786"
      expect(@new_york.format_digits(phone_number_1)).to eq("(518) 486-9786")
      
      phone_number_2 = "7189666155"
      expect(@new_york.format_digits(phone_number_2)).to eq("(718) 966-6155")
      #testing for potential other phone number formats coming in from data as suggested by my rock
      #learned a tiny bit about regular expressions in the process!
      phone_number_3 = "802-359-3536"
      expect(@new_york.format_digits(phone_number_3)).to eq("(802) 359-3536")

      nil_digits = nil
      expect(@new_york.format_digits(nil_digits)).to eq("No phone number listed")
    end
  end
end