class FacilityFactory
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def create_facilities(items)
    items.map do |item|
      if item[:state].include?("CO")
        new_facility = Facility.new({
        name: item[:dmv_office], 
        address: "#{item[:address_li]} #{item[:address__1]} #{item[:city]} #{item[:state]} #{item[:zip]}", 
        phone: item[:phone]})
        new_facility.add_service(item[:services_p])
        new_facility.services = new_facility.services[0].to_s.gsub(',' , "").gsub(';' , "").gsub('vehicle' , "").gsub('VIN' , "").split
          facilities << new_facility
      elsif item[:state].include?("NY")
        new_facility = Facility.new({
        name: "#{item[:office_name]} #{item[:office_type]}", 
        address: "#{item[:street_address_line_1]}, #{item[:street_address_line_2]} #{item[:city]}, #{item[:state]} #{item[:zip_code]}", 
        phone: item[:public_phone_number]})
          facilities << new_facility
      elsif item[:state].include?("MO")
        new_facility = Facility.new({
        name: item[:name], 
        address: "#{item[:address1]}, #{item[:city]}, #{item[:state]} #{item[:zipcode]}", 
        phone: item[:phone]})
          facilities << new_facility
      end
    end
  end

end

