class FacilityFactory
  attr_accessor :facilities
  def initialize
    @facilities = []
  end

  def or_create_facilities(data)
    data.each do |facility|
      facility_details = {
        name: facility[:title],
        address: or_find_address(facility),
        phone: facility[:phone_number]
      }
      facility_sorted = Facility.new(facility_details)
      self.facilities << facility_sorted
    end
    @facilities
  end

  def or_find_address(facility)
    address_h = eval(facility[:location_1][:human_address])
    address_s = address_h.values.join(' ')
  end

  def ny_create_facilities(data)
    data.each do |facility|
      facility_details = {
        name: facility[:office_namee],
        address: ny_find_address(facility),
        phone: facility[:public_phone_number]
      }
      facility_sorted = Facility.new(facility_details)
      self.facilities << facility_sorted
    end
    @facilities
  end

  def ny_find_address(facility)
    address_c = []
    address_c << facility[:street_address_line_1]
    address_c << facility[:city]
    address_c << facility[:state]
    address_c << facility[:zip_code]
    address_c.join(' ')
  end
end