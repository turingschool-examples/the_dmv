class FacilityFactory
    attr_reader :facilities_created

  def initialize

    @facilities_created = []    
  end

  def create_facilities(data)
    data.each do |dmv_data|
      # if dmv_data[:state] == "CO"
      @facilities_created << Facility.new({
      name: format_facility_name(dmv_data),
      # name: dmv_data[:dmv_office],
      address: format_facility_address(dmv_data),
      # address: ("#{dmv_data[:address_li]}#{" " + "#{dmv_data[:address__1]}" if dmv_data[:address__1] } #{dmv_data[:city]} #{dmv_data[:state]} #{dmv_data[:zip]}"),
      phone: format_facility_phone(dmv_data)
      })
      # end 
      @facilities_created
    end 
  end

  def format_facility_name(data)
    if data[:state] == "CO"
      data[:dmv_office]
    end
  end

  def format_facility_address(data)
    if data[:state] == "CO"
      ("#{data[:address_li]}#{" " + "#{data[:address__1]}" if data[:address__1] } #{data[:city]} #{data[:state]} #{data[:zip]}")  
    end
  end

  def format_facility_phone(data)
    if data[:state] == "CO"
      data[:phone]
    end
  end
end

#could do helper methods for each key -> name, address, and phone
