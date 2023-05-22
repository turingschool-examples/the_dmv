require './lib/facility'
require './lib/dmv_data_service'
require 'json'

class FacilityBuilder
  def initialize 
    @locations = []
  end

  def create_facilities(source)
    if source == DmvDataService.new.or_dmv_office_locations
    oregon_locations(source)
  elsif source == DmvDataService.new.ny_dmv_office_locations
    nys_locations(source)
  elsif source == DmvDataService.new.mo_dmv_office_locations
    mo_locations(source)
    end
    @locations
  end

  def oregon_locations(source)

      source.each do |office|
        address = JSON.parse(office[:location_1][:human_address])
        address = address.values.join(" ")
        or_location = {}
        or_location[:address] = address
        or_location[:name] = office[:title]
        or_location[:phone] = office[:phone_number]
        @locations << Facility.new(or_location)
      
      end
    end

    def nys_locations(source)

      source.each do |office|
        ny_location = {}
        ny_location[:address] = office[:street_address_line_1], office[:city], office[:state], office[:zip_code]
        ny_location[:name] = office[:office_name]
        ny_location[:phone] = office[:public_phone_number]
        @locations << Facility.new(ny_location)

      end
    end

    def mo_locations(source)

      source.each do |office|
        mo_location = {}
        mo_location[:address] = office[:address1], office[:city], office[:state], office[:zipcode]
        mo_location[:name] = office[:office_name]
        mo_location[:phone] = office[:phone]
        @locations << Facility.new(mo_location)
  
      end
    end
end