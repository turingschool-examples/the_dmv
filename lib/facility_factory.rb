class FacilityFactory

  def initialize; end

  def create_facility_or(facilities)
    facilities.map do |facility|
      eval_address = eval(facility[:location_1][:human_address])
      Facility.new({
                name: facility[:title],
                address: eval_address.fetch_values(:address, :city, :state, :zip).join(" "),
                phone: facility[:phone_number]
               })
    end
  end

  def create_facility_ny(facilities)
    facilities.map do |facility|
      require 'pry'; binding.pry
      eval_address = eval(facility[:location_1][:human_address])
      Facility.new({
                name: facility[:office_name],
                address: eval_address.fetch_values(:address, :city, :state, :zip).join(" "),
                phone: facility[:phone_number]
               })
    end
  end
end

# ny_address = eval(facility["street_address_line_1":])