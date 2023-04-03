class FacilityFactory

  def initialize; end

  def create_facility_or(or_facilities)
    or_facilities.map do |facility|
      eval_address = eval(facility[:location_1][:human_address])
      Facility.new({
                name: facility[:title],
                address: eval_address.fetch_values(:address, :city, :state, :zip).join(" "),
                phone: facility[:phone_number]
               })
    end
  end

  def create_facility_ny(ny_facilities)
    ny_facilities.map do |facility|
require 'pry'; binding.pry 
      Facility.new({
                name: facility[:office_name],
                address: ny_address = facility.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(" "),
                phone: facility[:phone_number]
               })
    end
  end
end