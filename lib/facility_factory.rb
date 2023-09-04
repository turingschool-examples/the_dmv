class Facility_Factory

  def initialize
  end

  def create_office_locations(locations)
    locations = locations.map do |facility|
      Facility.new(
      name: facility[:dmv_office],
      address: "#{facility[:address_li]} #{facility[:address_l]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}",
      phone: facility[:phone]
      )
    end
  end
end