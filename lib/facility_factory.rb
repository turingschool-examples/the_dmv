class FacilityFactory
  attr_reader :operating_facilities

  def initialize
    @operating_facilities = []
  end

  def define_facilities(facilities)
    facilities.each do |facility_data|
      if facility_data[:location_1].is_a?(Hash)
        address_data = JSON.parse(facility_data[:location_1][:human_address], symbolize_names: true)
        facility = Facility.new({
          name: facility_data[:title],
          address: "#{address_data[:address]} #{address_data[:city]} #{address_data[:state]} #{address_data[:zip]}",
          phone: facility_data[:phone_number]
          })
          @operating_facilities << facility
      elsif facility_data[:state] == "NY"
        facility = Facility.new({
          name: facility_data[:office_name],
          address: "#{facility_data[:street_address_line_1]} #{facility_data[:street_address_line_2]} #{facility_data[:city]} #{facility_data[:state]} #{facility_data[:zip_code]}",
          phone: facility_data[:public_phone_number]
          })
          @operating_facilities << facility 
      elsif facility_data[:state] == "MO"
        facility = Facility.new({
          name: facility_data[:name],
          address: "#{facility_data[:address1]} #{facility_data[:city]} #{facility_data[:state]} #{facility_data[:zipcode]}",
          phone: facility_data[:phone]
          })
          @operating_facilities << facility 
        else 
      end
    end
    @operating_facilities
  end
end