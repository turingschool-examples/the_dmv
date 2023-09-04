require './spec/spec_helper'

class FacilityFactory

  attr_reader :facilities

  def create_facilities(dds_data)
    facilities = dds_data.map do |facility|
      Facility.new(facility)
    end
    facilities
  end
end