class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(data)
    @facilities = data.map do |facility_data|
      if facility_data[:state] == "CO"
        Facility.new(
          {
            name: facility_data[:dmv_office],
            address: "#{facility_data[:address_li]} #{facility_data[:address__1]} #{facility_data[:city]} #{facility_data[:state]} #{facility_data[:zip]}",
            phone: facility_data[:phone]
          }
        )
      elsif facility_data[:state] == "NY"
        Facility.new(
          {
            name: "#{facility_data[:office_name]} #{facility_data[:office_type]}",
            address: "#{facility_data[:street_address_line_1]} #{facility_data[:city]} #{facility_data[:state]} #{facility_data[:zip_code]}",
            phone: facility_data[:public_phone_number]
          }
        )
      end
    end
  end
end