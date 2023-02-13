require 'facility'

class Dmv

  attr_reader :facilities, :rendered_facilities, :created_facilities

  def initialize
    @facilities = []
    @rendered_facilities = []
    @created_facilities = []
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

  def create_facilities(list)
    self.render_facility_data(list)
      @rendered_facilities.each do |facility_details|
        @created_facilities << Facility.new(facility_details)
      end
  end

end





