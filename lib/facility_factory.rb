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
        phone: item[:phone], 
        hours: item[:hours]})
        new_facility.add_service(item[:services_p])
        new_facility.services = new_facility.services[0].to_s.gsub(',' , "").gsub(';' , "").gsub('vehicle' , "").gsub('VIN' , "").split
          facilities << new_facility
      elsif item[:state].include?("NY")
        new_facility = Facility.new({
        name: "#{item[:office_name]} #{item[:office_type]}", 
        address: "#{item[:street_address_line_1]}, #{item[:street_address_line_2]} #{item[:city]}, #{item[:state]} #{item[:zip_code]}", 
        phone: item[:public_phone_number],
        hours: "Monday: #{item[:monday_beginning_hours]}-#{item[:monday_ending_hours]}; Tuesday: #{item[:tuesday_beginning_hours]}-#{item[:tuesday_ending_hours]}; Wednesday: #{item[:wednesday_beginning_hours]}-#{item[:wednesday_ending_hours]}; Thursday: #{item[:thursday_beginning_hours]}-#{item[:thursday_ending_hours]}; Friday: #{item[:friday_beginning_hours]}-#{item[:friday_ending_hours]}; Saturday: #{item[:saturday_beginning_hours]}-#{item[:saturday_ending_hours]}" })
          facilities << new_facility
      elsif item[:state].include?("MO")
        new_facility = Facility.new({
        name: item[:name], 
        address: "#{item[:address1]}, #{item[:city]}, #{item[:state]} #{item[:zipcode]}", 
        phone: item[:phone],
        hours: item[:daysopen]})
          facilities << new_facility
      end
    end
  end

end

