require './lib/facility'
require './lib/dmv_data_service'
require 'json'

class FacilityBuilder
  def initialize 
    @locations = []
  end

  def create_facilities(source)
      oregon_locations(source)
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

 
end