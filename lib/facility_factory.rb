class FacilityFactory
  def initialize
  end

  def create_facilities(registrations)
    registrations.map do |facility_data|
      if facility_data[:name]
        facility_data[:name]
      else
      facility_data[:name] = 
        if facility_data[:dmv_office]
          facility_data.delete :dmv_office
        elsif facility_data[:office_name]
          facility_data.delete :office_name
        end
      end

      facility_data[:address] = "#{facility_data[:address_li] }" + "#{facility_data[:office_name]}" + "#{facility_data[:address_1]}" + "#{facility_data[:street_address_line_1]}" + "#{facility_data[:address1]}" " #{facility_data[:city]}" + " #{facility_data[:state]}" + " #{facility_data[:zip]}" + "#{facility_data[:zip_code]}" + "#{facility_data[:zipcode]}"

      facility_data[:services] = if facility_data[:services_p]
        if facility_data[:services_p].include?("registration")
          ["Vehicle Registration"]
          end
        else
        []
        end

      Facility.new(facility_data)
    end
  end
end