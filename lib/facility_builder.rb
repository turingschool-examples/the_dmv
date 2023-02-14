require 'json'

class FacilityBuilder
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def build_facilities(data_source)
    state_facility_data = []
    build_hash(data_source, state_facility_data)
    state_facility_data.each do |facility_details|
      @facilities << Facility.new(facility_details)
    end
    @facilities
  end

  def build_hash(data_source, facility_data_array)
    if data_source == DmvDataService.new.or_dmv_office_locations
      data_source.each do |data_hash|
        facility_details = {}
        facility_details[:name] = data_hash[:title]
        facility_details[:address] = JSON.parse(data_hash[:location_1][:human_address]).values.join(' ')
        facility_details[:phone] = data_hash[:phone_number]
        facility_data_array << facility_details
      end
    elsif data_source == DmvDataService.new.ny_dmv_office_locations
      data_source.each do |data_hash|
        facility_details = {}
        facility_details[:name] = "#{data_hash[:office_name]} #{data_hash[:office_type]}"
        facility_details[:address] = data_hash.values_at(:street_address_line_1, :city, :state, :zip_code).join('')
        facility_details[:phone] = data_hash[:public_phone_number]
        facility_data_array << facility_details
      end
    elsif data_source == DmvDataService.new.mo_dmv_office_locations
      data_source.each do |data_hash|
        facility_details = {}
        facility_details[:name] = data_hash[:name]
        facility_details[:address] = data_hash.values_at(:address1, :city, :state, :zipcode).join('')
        facility_details[:phone] = data_hash[:phone]
        facility_data_array << facility_details
      end
    end
    facility_data_array
  end
end
