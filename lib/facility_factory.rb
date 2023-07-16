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
      address: ("#{dmv_data[:address_li]}#{" " + "#{dmv_data[:address__1]}" if dmv_data[:address__1] } #{dmv_data[:city]} #{dmv_data[:state]} #{dmv_data[:zip]}"),
      phone: dmv_data[:phone]
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
end

#could do helper methods for each key -> name, address, and phone
