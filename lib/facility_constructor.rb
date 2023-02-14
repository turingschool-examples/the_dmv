require 'spec_helper'

class FacilityConstructor
  attr_reader :created_facilities, :daily_hours, :facility_checker

    @@dmv_office_location = DmvDataService.new.or_dmv_office_locations
    @@new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @@missouri_facilities = DmvDataService.new.mo_dmv_office_locations

  def initialize
    @created_facilities = []
  end
  
  def create_facility(location_data)
    facility_checker(location_data)
  end

  


  # helper methods

  def facility_checker(location_data)
    if location_data == @@dmv_office_location
      @@dmv_office_location.each do |office|
        facility_info = {
          name: office[:title],
          address: office[:location_1][:human_address], # Go back and try to refactor this so it returns a string without the /n
          phone: office[:phone_number],
          zipcode: office[:zip_code]
        }
        @created_facilities << facility = Facility.new(facility_info)
      end
      @created_facilities
    elsif location_data == @@new_york_facilities
      @@new_york_facilities.each do |office|
        facility_info = {
          name: office[:office_name],
          address: [office[:street_address_line_1], office[:city], office[:state]], # I think i actually want to store this as a hash...
          phone: office[:public_phone_number],
          zipcode: office[:zip_code],
          daily_hours: [
            monday: {
              open: office[:monday_beginning_hours],
              close: office[:monday_ending_hours]
            },
            tuesady: {
              open: office[:tuesday_beginning_hours],
              close: office[:tuesday_ending_hours]
            },
            wednesday: {
              open: office[:wednesday_beginning_hours],
              close: office[:wednesday_ending_hours]
            },
            thursday: {
              open: office[:thursday_beginning_hours],
              close: office[:thursday_ending_hours]
            },
            friday: {
              open: office[:friday_beginning_hours],
              close: office[:friday_ending_hours]
            }
          ] 
        }
        @created_facilities << facility = Facility.new(facility_info)
      end
      @created_facilities
    else location_data == @@missouri_facilities
      @@missouri_facilities.each do |office|
        facility_info = {
          name: office[:name],
          address: [office[:address1], office[:city], office[:state]],
          phone: office[:phone],
          daily_hours: office[:daysopen],
          holidays_closed: office[:holidaysclosed],
          zipcode: office[:zipcode],
        }
        @created_facilities << facility = Facility.new(facility_info)
      end
      @created_facilities
    end
  end
end