require "spec_helper"

class FacilityFactory
  attr_reader :facilities
  
  def initialize
    @facilities = []
  end

  def determine_name(facility)
    if facility.keys.include?(:title)
      facility[:title]
    elsif facility.keys.include?(:office_name)
      facility[:office_name]
    elsif facility.keys.include?(:name)
      facility[:name]
    end  
    end

    def determine_address(facility)
      if facility.keys.include?(:location_1)
        facility[:location_1][:human_address].split(":")[1].split(",")[0][2..-2]
      elsif facility.keys.include?(:street_address_line_1)
        facility[:street_address_line_1]
      elsif facility.keys.include?(:address1)
        facility[:address1]
      end
    end

    
end