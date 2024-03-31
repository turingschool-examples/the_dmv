class FacilityFactory
  def initialize
  end

  def create_facilities(registrations)
    registrations.map do |hash|
      if hash[:name]
        hash[:name]
      else
      hash[:name] = 
        if hash[:dmv_office]
          hash.delete :dmv_office
        elsif hash[:office_name]
          hash.delete :office_name
        end
      end

      hash[:address] = "#{hash[:address_li] }" + "#{hash[:office_name]}" + "#{hash[:address_1]}" + "#{hash[:street_address_line_1]}" + "#{hash[:address1]}" " #{hash[:city]}" + " #{hash[:state]}" + " #{hash[:zip]}" + "#{hash[:zip_code]}" + "#{hash[:zipcode]}"
      # should be a better way to filter address but currently works, not scalable
      # maybe a key condition and accumulator 
      hash[:services] = if hash[:services_p]
        "Vehicle Registration" if hash[:services_p].include?("registration")
      end

      Facility.new(hash)
    end
  end
end