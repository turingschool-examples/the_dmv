require './spec/spec_helper'
require 'pry'

class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities.push(facility)
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def co_facilities(details)
    details.each do |detail|
      facility = Facility.new(
        name: detail[:dmv_office],
        address: detail[:address_li],
        address_1: detail[:address__1],
        phone: detail[:phone],
        services: detail[:services_p] || [],
        registered_vehicles: detail[:registered_vehicles] || [],
        collected_fees: 0
        # colorado_facilities = DmvDataService.new.co_dmv_office_locations
        # dmv = Dmv.new
        # dmv.co_facilities(colorado_facilities)
  
      )
      @facilities << facility
    end
  end

  def ny_facilities(details)
    details.each do |detail|
      facility = Facility.new(
        name: detail[:office_name],
        address: detail[:street_address_line_1],        
        phone: detail[:public_phone_number] || nil,        
        address_1: detail[:city],        
        services: [],        
        registered_vehicles: [],        
        collected_fees: 0
        # new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        # dmv = Dmv.new
        # dmv.ny_facilities(new_york_facilities)

      )
      @facilities << facility
      
    end
  end

  def mo_facilities(details)
    details.each do |detail|
      facility = Facility.new(
        name: detail[:name],
        address: detail[:address1],        
        phone: detail[:phone] || nil,        
        address_1: detail[:city],        
        services: [],        
        registered_vehicles: [],        
        collected_fees: 0
        # missouri_facilities = DmvDataService.new.mo_dmv_office_locations
        # dmv = Dmv.new
        # dmv.mo_facilities(missouri_facilities)

      )
      @facilities << facility
      
    end
  end
end
