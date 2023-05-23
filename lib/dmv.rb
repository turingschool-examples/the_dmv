class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(*service)
    arr =[]
    service.each do |i|  
    @facilities.each do |facility|
      if facility.services.include?(i)
        arr << facility
      end
     end
    end
    arr
  end

  def create_facilities(facilities)
    
    new_facility_arr = []
  
    if facilities[0][:state] == "NY"
        facilities.each do |i| 
          facility_deatails = {name: nil, address: nil, phone: nil}
            facility_deatails[:name] = i[:office_name]
            facility_deatails[:address] = "#{i[:street_address_line_1]} #{i[:street_address_line_2]} #{i[:city]} #{i[:state]} #{i[:zip_code]}"
            facility_deatails[:phone] = i[:public_phone_number]
            new_facility_arr << facility_deatails
        end
    elsif facilities[0][:state] == "MO"
        facilities.each do |i| 
          facility_deatails = {name: nil, address: nil, phone: nil}
            facility_deatails[:name] = i[:name]
            facility_deatails[:address] = "#{i[:address1]} #{i[:city]} #{i[:state]} #{i[:zipcode]}"
            facility_deatails[:phone] = i[:phone]
            new_facility_arr << facility_deatails
        end
    elsif facilities[0][:location_1][:human_address].include?("OR")
        facilities.each do |i| 
          facility_deatails = {name: nil, address: nil, phone: nil}
            facility_deatails[:name] = i[:title]
            facility_deatails[:address] = i[:location_1][:human_address]
            facility_deatails[:phone] = i[:phone_number]

            new_facility_arr << facility_deatails
        end
    end
    new_facilities_hash = new_facility_arr.map{ |i| Facility.new(i) }
    new_facilities_hash

   
  end

end
