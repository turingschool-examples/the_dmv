require 'json'

class FacilityBuilder
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def build_facilities(data)
    state_data = []
    data.each do |data_hash|
      facility_details = {}
      facility_details[:name] = data_hash[:title]
      facility_details[:address] = JSON.parse(data_hash[:location_1][:human_address]).values.join(' ')
      facility_details[:phone] = data_hash[:phone_number]
      state_data << facility_details
    end
    state_data.each do |facility_details|
      @facilities << Facility.new(facility_details)
    end
    @facilities
  end
end
