require 'spec_helper'

RSpec.describe 'Analyize Data' do
  describe 'EV Registration' do
    before(:each) do
      @factory = VehicleFactory.new
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @wa_vehicles = @factory.create_vehicles(@wa_ev_registrations)
      
    end
    xit 'finds the most popular make and model' do
      # CODE HERE
    end

    xit 'counts number of registered vehicles by model year' do
      # CODE HERE
    end

    it 'finds county that has most registered vehicles' do
      county_with_most = @factory.most_by_county(@wa_ev_registrations)
    
      expect(county_with_most).to be_a(String)
      expect(county_with_most).to eq("King")
    end
  end

  describe 'Facilities' do 
    before(:each) do
    @dmv_office_location = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    @facility = FacilityConstructor.new  
    end

    xit 'finds daily hours for NY facilities' do
      new_york =  @facility.create_facility(@new_york_facilities)
      
      expect(new_york.first.daily_open_hours).to eq([
        {:monday=>{:open=>"8:30 AM", :close=>"4:15 PM"},
        :tuesady=>{:open=>"8:30 AM", :close=>"4:15 PM"},
        :wednesday=>{:open=>"8:30 AM", :close=>"4:15 PM"},
        :thursday=>{:open=>"8:30 AM", :close=>"5:45 PM"},
        :friday=>{:open=>"8:30 AM", :close=>"4:15 PM"}}])
    end

    xit 'finds daily hours for OR facilities' do
      oregon_facilities = @facility.create_facility(@dmv_office_location)

      expect(oregon_facilities.first).to be_a(Facility)
      expect(oregon_facilities.first.daily_open_hours).to be(nil)
    end

    xit 'finds daily hours for MO facilities' do
      missouri =  @facility.create_facility(@missouri_facilities)
      mo = missouri.first.daily_open_hours

      expect(mo).to eq("Monday - Friday - 8:30 to 5:00, Last 4 week days - 8:00 to 5:00")
    end
      
    xit 'which holidays are closed for each specific state' do
      missouri =  @facility.create_facility(@missouri_facilities)
      mo = missouri.first.closed_for_the_holidays

      expect(mo).to eq("Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")

    end
  end

  describe 'Vehicles' do
    xit 'creates vehicle objects from NY State Registration data' do
      factory = VehicleFactory.new
      ny_state_registrations = DmvDataService.new.ny_state_registrations
      created_vehicles = factory.create_vehicles(ny_state_registrations)
      
      expect(created_vehicles).to be_a(Array)
      expect(created_vehicles.first).to be_a(Vehicle)
      expect(created_vehicles.length).to be(250)
    end
  end
end