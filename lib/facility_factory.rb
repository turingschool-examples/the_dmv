class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(dmv_locations_data)
    dmv_locations_data.each do |dmv|
      name = dmv[:dmv_office] || dmv[:office_name] || dmv[:name]
      phone = dmv[:phone] || dmv[:public_phone_number]
      services = dmv[:services_p]
      address_line_1 = dmv[:address_li] || 
                      dmv[:street_address_line_1] ||
                      dmv[:address1]
      address_line_2 = dmv[:address__1] || 
                      dmv[:street_address_line_2]
      address_line_3 = dmv[:location]
      city = dmv[:city]
      state = dmv[:state]
      zip = dmv[:zip] || 
            dmv[:zip_code] || 
            dmv[:zipcode]
      if address_line_3 != nil
        address = address_line_1 + " " + 
                  address_line_2 + " " +
                  address_line_3 + " " +
                  city + " " +
                  state + " " +
                  zip
      elsif address_line_2 == nil && address_line_3 == nil
        address = address_line_1 + " " + 
                  city + " " +
                  state + " " +
                  zip
      else
        address = address_line_1 + " " + 
                  address_line_2 + " " +
                  city + " " +
                  state + " " +
                  zip
      end
      @facilities << Facility.new({name: name,
                                  address: address, 
                                  phone: phone,
                                  services: services})
    end
  end

end
