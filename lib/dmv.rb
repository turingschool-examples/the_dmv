require 'facility'

class Dmv

  attr_reader :facilities, :rendered_facilities, :created_facilities

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

  def render_facility_data_ny(list)
    list.each do |spec|
      rendered_data = {
          name: "#{spec[:office_name]} #{spec[:office_type]}",
          address: "#{spec[:street_address_line_1]} #{spec[:city]} #{spec[:state]} #{spec[:zip_code]}",
          phone: (spec[:public_phone_number]),
        }
      @rendered_facilities << rendered_data
    end
  end

  def render_facility_data_or(list)
    list.each do |spec|
     address_to_format = spec.dig(:location_1, :human_address)
     address_hash = JSON.parse address_to_format
        rendered_data = {
          name: (spec[:title]),
          address: (address_hash.values.join(' ')),
          phone: (spec[:phone_number]),
        }
      @rendered_facilities << rendered_data
    end
  end

  def create_facilities(list)
    self.render_facility_data(list)
    ###will need to add state checker method and update above code
      @rendered_facilities.each do |facility_details|
        @facilities << Facility.new(facility_details)
      end
  end

end





