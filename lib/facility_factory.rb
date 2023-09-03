class FacilityFactory
  attr_reader :locations

  def initialize
    @locations = []
  end

  def create_locations(data)
    data.each do |facility_data|
      new_facility = Facility.new(
        name: facility_data[:dmv_office],
        address: "#{facility_data[:address_li]} #{facility_data[:address__1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip]}",
        phone: facility_data[:phone]
      )
      new_facility.services << facility_data[:services_p]
      @locations << new_facility
    end
  end
end