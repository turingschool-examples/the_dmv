require "json"


class FacilityFactory
  def create_facilities(dmv_facilities_data)
    dmv_facilities_data.map do |facility_data|
      standardized_data = standardize_facility_data(facility_data)
      Facility.new(standardized_data)
    end
  end

  def standardize_facility_data(facility_data)
    data = {
      name: standardize_name(facility_data),
      address: standardize_address(facility_data),
      phone: standardize_phone(facility_data)
    }
  end

  def standardize_name(facility_data)
    facility_data[:title]
  end

  def standardize_address(facility_data)
    address = JSON.parse(facility_data[:location_1][:human_address], :symbolize_names => true)
    "#{address[:address]}, #{address[:city]} #{address[:state]} #{address[:zip]}"
  end

  def standardize_phone(facility_data)
    facility_data[:phone_number]
  end

end




# from Facility class:
# def initialize(facility_details)
#   @name = facility_details [:name]
#   @address = facility_details [:address]
#   @phone = facility_details [:phone]