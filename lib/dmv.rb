class Dmv
  attr_reader :facilities, :list_of_offices

  def initialize
    @facilities = []
  end
  
  def add_facility(facility)
    @facilities << facility
  end
  
  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end
  
  def create_facility_helper(offices)
    @list_of_offices = offices.map do |office|
      if office[:state] == 'CO'
        address_data = office[:address_li], office[:address__1], office[:city], office[:state], office[:zip]
        full_address = address_data.join(" ")
        facility_details = { name: office[:dmv_office], address: full_address, phone: office[:phone]}
      elsif office[:state] == 'NY'
        if office[:street_address_line_2] != nil
          address_data = office[:street_address_line_1], office[:street_address_line_2], office[:city], office[:state], office[:zip_code]
        else
          address_data = office[:street_address_line_1], office[:city], office[:state], office[:zip_code]
        end
        full_address = address_data.join(" ")
        office_data = office[:office_name], office[:office_type]
        office_name = office_data.join(" ")
        phone_data = office[:public_phone_number] 
          if phone_data != nil  
            update_phone = phone_data.insert(0, "(").insert(4, ")").insert(5, ' ').insert(-5, '-')
          end
        facility_details = { name: office_name, address: full_address, phone: update_phone }
      else
        address_data = office[:address1], office[:city], office[:state], office[:zipcode]
        full_address = address_data.join(' ')
        facility_details = { name: office[:name], address: full_address, phone: office[:phone] }
      end
    end
  end

  def create_facility
    offices = @list_of_offices.map do |office|
      facility = Facility.new(office)
    end
  end
end
