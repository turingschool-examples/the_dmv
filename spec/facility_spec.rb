require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 't1 can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 't2 can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "i2.a facility can handle a car" do
    it "t4 vehicles can recieve plate time stamped" do
      expect(@facility_1.add_service("Vehicle Registration")).to eq(["Vehicle Registration"])
      expect(@cruz.registration_date).to be(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
    end

    it "t5 can store registered vehicals" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
    
    it "t6 can collect fees" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe "i2.a facility can handle multiple cars" do
    
    it "t7 can give vehicles different plates" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end
    
    it "t8 can collect and get a sum of fees" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe "i2.a facilities cannot offer services they don't have" do
    it "t9 not allow a facility to register a vehicle unless it has that service" do
      @facility_1.register_vehicle(@bolt)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
    
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe "i2.b facilities can give tests to registrants" do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
    end
    describe "Written test" do
      it "t10 cannot administer tests without offering said service" do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.permit?).to be true
        expect(@facility_1.administer_written_test(@registrant_1)).to be false
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it "t11 can administer tests if offering said service" do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@facility_1.add_service('Written Test')).to eq(["Written Test"])
        expect(@facility_1.administer_written_test(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it "t12 will not give written test to registrant without permit" do
        @facility_1.add_service('Written Test')
        expect(@registrant_2.age).to eq(16)
        expect(@registrant_2.permit?).to eq(false)

        expect(@facility_1.administer_written_test(@registrant_2)).to be false
        @registrant_2.earn_permit
        expect(@facility_1.administer_written_test(@registrant_2)).to be true

        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it "t13 will not give test to people under 16" do
        @facility_1.add_service('Written Test')
        expect(@registrant_3.age).to eq(15)
        expect(@registrant_3.permit?).to eq(false)

        expect(@facility_1.administer_written_test(@registrant_2)).to be false
        @registrant_3.earn_permit

        expect(@facility_1.administer_written_test(@registrant_2)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    end

    describe "Road test" do
      it "t14 will not give the Road Test to registrant on permit without service" do
        @facility_1.add_service('Written Test')

        expect(@facility_1.administer_road_test(@registrant_3)).to be false

        @registrant_3.earn_permit

        expect(@facility_1.administer_road_test(@registrant_3)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it "t15 will administer a Road Test if has the service and registrant has completed the written test" do
        @facility_1.add_service('Written Test')
        @facility_1.administer_written_test(@registrant_1)
        @registrant_2.earn_permit
        @facility_1.administer_written_test(@registrant_2)
        
        expect(@facility_1.administer_road_test(@registrant_1)).to be false
        expect(@facility_1.add_service("Road Test")).to eq(["Written Test", "Road Test"])
        expect(@facility_1.administer_road_test(@registrant_1)).to be true

        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
        
        expect(@facility_1.administer_road_test(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end
    end

    describe "Renew License" do
      it "t16 can only renew license if it has said service" do
        @facility_1.add_service("Written Test")
        @facility_1.add_service("Road Test")
        @facility_1.administer_written_test(@registrant_1)
        @facility_1.administer_road_test(@registrant_1)

        expect(@facility_1.renew_drivers_license(@registrant_1)).to be false

        expect(@facility_1.add_service('Renew License')).to eq(["Written Test", "Road Test", "Renew License"])
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end

      it "t17 cannot renew driver who have not passed the road test" do
        @facility_1.add_service("Written Test")
        @facility_1.add_service("Road Test")
        @facility_1.add_service("Renew License")
        @registrant_2.earn_permit
        @facility_1.administer_written_test(@registrant_2)
        @facility_1.administer_road_test(@registrant_2)

        expect(@facility_1.renew_drivers_license(@registrant_3)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

        expect(@facility_1.renew_drivers_license(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end
    end
  end

  describe "use tests" do
    it "ht1 #issue_plate_fees can issue new place and add to collected fees" do
      @facility_1.issue_plate_fees(@cruz)
      @facility_1.issue_plate_fees(@bolt)
      @facility_1.issue_plate_fees(@camaro)

      expect(@facility_1.collected_fees).to eq(325)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
    end
  end

  describe "API use tests" do
    let (:colorado_datapoint) {{:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]}, :dmv_id=>"1", :dmv_office=>"DMV Tremont Branch", :address_li=>"2855 Tremont Place", :address__1=>"Suite 118", :city=>"Denver", :state=>"CO", :zip=>"80205", :phone=>"(720) 865-4600", :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.", :services_p=>"vehicle titles, registration, renewals;  VIN inspections", :parking_no=>"parking available in the lot at the back of the bldg (Glenarm Street)", :photo=>"images/Tremont.jpg", :address_id=>"175164", :":@computed_region_nku6_53ud"=>"1444"}}
    let (:new_york_datapoint) {{:office_name=>"JAMAICA", :office_type=>"DISTRICT OFFICE", :public_phone_number=>"7189666155", :street_address_line_1=>"168-46 91ST AVE., 2ND FLR", :city=>"JAMAICA", :state=>"NY", :zip_code=>"11432", :monday_beginning_hours=>"7:30 AM", :monday_ending_hours=>"5:00 PM", :tuesday_beginning_hours=>"7:30 AM", :tuesday_ending_hours=>"5:00 PM", :wednesday_beginning_hours=>"7:30 AM", :wednesday_ending_hours=>"5:00 PM", :thursday_beginning_hours=>"7:30 AM", :thursday_ending_hours=>"5:00 PM", :friday_beginning_hours=>"7:30 AM", :friday_ending_hours=>"5:00 PM", :georeference=>{:type=>"Point", :coordinates=>[-73.79144381399993, 40.70757552100008]}, :":@computed_region_yamh_8v7k"=>"196", :":@computed_region_wbg7_3whc"=>"1216", :":@computed_region_kjdx_g34t"=>"2137"}}
    let (:missouri_datapoint) {{:number=>"086", :dorregionnumber=>"14", :type=>"1MV", :name=>"DEXTER", :address1=>"119 VINE ST", :city=>"DEXTER", :state=>"MO", :zipcode=>"63841", :county=>"Stoddard", :phone=>"(573) 624-8808", :fax=>"(573) 624-8724", :size=>"2", :email=>"DEXTERAGENTOFFICE@DOR.MO.GOV", :agent=>"STODDARD COUNTY LICENSE OFFICE", :officemanager=>"RAY ROWLAND", :daysopen=>"Monday - Friday - 8:30 to 4:30", :holidaysclosed=>"Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)", :additionaldaysclosed=>"10/4/2022 (at 2:00 PM),   11/25/22,   12/22/2022 (at 3:00 PM ),   12/23/22,  12/24/22,  12/26/22,   12/27/2022 (open at 8:30 AM ),  1/31/2023,   4/7/23,   7/3/23,   11/24/23,   12/22/23", :latlng=>{:latitude=>"36.791655", :longitude=>"-89.955942"}, :additional_license_office_info=>"Services for the Elderly or Disabled: Curbside Service, Special Appointments, Assist with changing or replacing plates/tabs, Process Transactions in the customer waiting area, Direct customers to front of the line, Wheelchair availability. MOTOR VEHICLE PHONE IN RENEWAL - (573) 624-8808Other Services: Motor Vehicle transaction drop-off service.", :":@computed_region_ny2h_ckbz"=>"452", :":@computed_region_c8ar_jsdj"=>"98", :":@computed_region_ikxf_gfzr"=>"2215"}}
    
    it "ut2 #name_finder can finds names from different APIs" do
      expect(@facility_1.name_finder(colorado_datapoint)).to eq("DMV Tremont Branch")
      expect(@facility_1.name_finder(new_york_datapoint)).to eq("JAMAICA")
      expect(@facility_1.name_finder(missouri_datapoint)).to eq("DEXTER")
    end
    
    it "ut3 #address_finder can finds addresses from different APIs" do
      expect(@facility_1.address_finder(colorado_datapoint)).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
      expect(@facility_1.address_finder(new_york_datapoint)).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
      expect(@facility_1.address_finder(missouri_datapoint)).to eq("119 VINE ST DEXTER MO 63841")
    end
    
    it "ut4 #co_address_formatter can format colorado addresses with five and four lines" do
      four_line_co_address = {:the_geom=>{:type=>"Point", :coordinates=>[-105.03590369947995, 39.77608961495372]}, :dmv_id=>"3", :dmv_office=>"DMV Northwest Branch", :address_li=>"3698 W. 44th Avenue", :location=>"Safeway Plaza", :city=>"Denver", :state=>"CO", :zip=>"80211", :phone=>"(720) 865-4600", :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.", :services_p=>"vehicle titles, registration, renewals;  VIN inspections", :parking_no=>"parking in the lot in front of the building", :photo=>"images/44thAve.jpg", :address_id=>"29409", :":@computed_region_nku6_53ud"=>"1444"}
      #five line address
      expect(@facility_1.co_address_formatter(colorado_datapoint)).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
      #four line address
      expect(@facility_1.co_address_formatter(four_line_co_address)).to eq("3698 W. 44th Avenue Denver CO 80211")
    end
    
    it "ut5 #ny_address_formatter can format new york addresses with five and four lines" do
      five_line_ny_address = {:office_name=>"MALONE", :office_type=>"COUNTY OFFICE", :public_phone_number=>"5184811606", :street_address_line_1=>"355 WEST MAIN STREET", :street_address_line_2=>"ROOM 107", :city=>"MALONE", :state=>"NY", :zip_code=>"12953", :monday_beginning_hours=>"8:00 AM", :monday_ending_hours=>"3:30 PM", :tuesday_beginning_hours=>"8:00 AM", :tuesday_ending_hours=>"3:30 PM", :wednesday_beginning_hours=>"8:00 AM", :wednesday_ending_hours=>"3:30 PM", :thursday_beginning_hours=>"8:00 AM", :thursday_ending_hours=>"3:30 PM", :friday_beginning_hours=>"8:00 AM", :friday_ending_hours=>"3:30 PM", :georeference=>{:type=>"Point", :coordinates=>[-74.295308429, 44.849171487]}, :":@computed_region_yamh_8v7k"=>"182", :":@computed_region_wbg7_3whc"=>"278", :":@computed_region_kjdx_g34t"=>"621"}
      #five line address
      expect(@facility_1.ny_address_formatter(five_line_ny_address)).to eq("355 WEST MAIN STREET ROOM 107 MALONE NY 12953")
      #four line address
      expect(@facility_1.ny_address_formatter(new_york_datapoint)).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
    end
    
    it "ut5 #mo_address_formatter can format missouri addresses with five and four lines" do
      #four line address
      expect(@facility_1.mo_address_formatter(missouri_datapoint)).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
    end



  end




end
