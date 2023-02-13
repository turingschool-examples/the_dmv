require 'facility'

class Dmv

  attr_reader :facilities, :rendered_facilities

  def initialize
    @facilities = []
    @rendered_facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def render_facility_data(list)
    list.each do |spec|
     address_to_format = spec.dig(:location_1, :human_address)
     address_hash = JSON.parse address_to_format
        rendered_data = {
          name: (spec[:title]),
          address: (address_hash.values.join(" ")),
          phone: (spec[:phone_number]),
        }
      @rendered_facilities << rendered_data
    end
  end

end



# @facility_1 = Facility.new(
  # {name: 'Albany DMV Office',
#  address: '2242 Santiam Hwy SE Albany OR 97321',
#  phone: '541-967-2014' })


# DmvDataService.new.or_dmv_office_locations.first[:location_1][:human_address][:address].gsub(/[\"]/,"")

