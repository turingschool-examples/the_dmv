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
      address_hash = JSON.parse(facility[:location_1][:human_address], symbolize_names: true)
      "#{address_hash[:address]}, #{address_hash[:city]}, #{address_hash[:state]} #{address_hash[:zip]}"
    elsif facility.keys.include?(:street_address_line_1)
      "#{facility[:street_address_line_1]}, #{facility[:city]}, #{facility[:state]} #{facility[:zip_code]}"
    elsif facility.keys.include?(:address1)
      "#{facility[:address1]}, #{facility[:city]}, #{facility[:state]} #{facility[:zipcode]}"
    end
  end

  def determine_phone(facility)
    if facility.keys.include?(:phone_number)
      facility[:phone_number]
    elsif facility.keys.include?(:office_type)
      facility[:public_phone_number] ? facility[:public_phone_number].insert(6, "-").insert(3, "-") : "NONE"
    elsif facility.keys.include?(:phone)
      facility[:phone].delete("( )").insert(3, "-")
    end
  end

  def create_facilities(database)
    database.each do |facility|
      @facilities << Facility.new(
        {
          name: determine_name(facility),
          address: determine_address(facility),
          phone: determine_phone(facility)
        }
      )
    end
  end
end
