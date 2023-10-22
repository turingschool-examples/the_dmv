

class FacilityFactory

  def initialize
  end

  def create_facility(input_api)
    co_total_facility_array = []
    ny_total_facility_array = []
    mo_total_facility_array = []

    if input_api.first[:state] == "CO"
      input_api.each do |facility_raw_info|
        input_hash = {}
        input_hash[:name] = facility_raw_info[:dmv_office]
        input_hash[:address] = "#{facility_raw_info[:address_li]}, #{facility_raw_info[:address__1]}, #{facility_raw_info[:city]}, #{facility_raw_info[:state]} #{facility_raw_info[:zip]}"
        input_hash[:phone] = facility_raw_info[:phone]
        co_total_facility_array << Facility.new(input_hash)
      end
    return co_total_facility_array
  
    elsif input_api.first[:state] == "NY"
      input_api.each do |facility_raw_info|
        input_hash = {}
        input_hash[:name] = facility_raw_info[:office_name]
        input_hash[:address] = "#{facility_raw_info[:street_address_line_1]}, #{facility_raw_info[:city]}, #{facility_raw_info[:state]} #{facility_raw_info[:zip_code]}"
        input_hash[:phone] = facility_raw_info[:public_phone_number]
        ny_total_facility_array << Facility.new(input_hash)
      end
    return ny_total_facility_array

    elsif input_api.first[:state] == "MO"
      input_api.each do |facility_raw_info|
        input_hash = {}
        input_hash[:name] = facility_raw_info[:name]
        input_hash[:address] = "#{facility_raw_info[:address1]}, #{facility_raw_info[:city]}, #{facility_raw_info[:state]} #{facility_raw_info[:zipcode]}"
        input_hash[:phone] = facility_raw_info[:phone]
        mo_total_facility_array << Facility.new(input_hash)
      end
    return mo_total_facility_array
    end
  end
end