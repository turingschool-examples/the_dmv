class FacilitiesByState

  attr_reader :or, 
              :ny, 
              :mo

  def initialize
    @or = []
    @ny = []
    @mo = []
    @all_facilities = [@or, @ny, @mo]
  end

  def all_facilities
    @all_facilities.flatten
  end

    def create_facilities(data)
      if data[0][:state] == 'NY'
        create_ny_facilities(data)
      elsif data[0][:state] == 'MO'
        create_mo_facilities(data)
      else
        create_or_facilities(data)
      end
    end

    def parse_string(json_string)
      JSON.parse(json_string, symbolize_names: true)
    end

    def create_or_facilities(data)
      data.each do |facility|
        parsed_address = parse_string(facility[:location_1][:human_address])
        facility_details = {
          name: facility[:title], 
          address: "#{parsed_address[:address]}, #{parsed_address[:city]}, #{parsed_address[:state]}, #{parsed_address[:zip]}",
          phone: facility[:phone_number]&.delete("-"),
          monday: 'Hours not given',
          tuesday: 'Hours not given', 
          wednesday: 'Hours not given', 
          thursday: 'Hours not given', 
          friday: 'Hours not given'
        }
          @or << Facility.new(facility_details)
      end
    end

    def create_ny_facilities(data)
      data.each do |facility|
        facility_details = {
          name: facility[:office_name],
          address: "#{facility[:street_address_line_1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zip_code]}", 
          phone: facility[:public_phone_number],
          monday: "#{facility[:monday_beginning_hours]} to #{facility[:monday_ending_hours]}",
          tuesday: "#{facility[:tuesday_beginning_hours]} to #{facility[:tuesday_ending_hours]}",
          wednesday: "#{facility[:wednesday_beginning_hours]} to #{facility[:wednesday_ending_hours]}",
          thursday: "#{facility[:thursday_beginning_hours]} to #{facility[:thursday_ending_hours]}",
          friday: "#{facility[:friday_beginning_hours]} to #{facility[:friday_ending_hours]}",
          
        } 
        @ny << Facility.new(facility_details)
      end
    end

    def create_mo_facilities(data)
      data.each do |facility|
        facility_details = {
          name: facility[:name],
          address: "#{facility[:address1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zipcode]}",
          phone: facility[:phone]&.delete("() -")
        }
        @mo << Facility.new(facility_details)
      end
    end
end












# This worked but it doesn't seem like it would be easy to scale and it was easily broken
# Still had fun trying out the OrEqual operator
# My Rubinstein =>

# def create_facilities(data)
#   data.each do |facility|
#     facility_details = {
#       name: facility[:title] ||= facility[:name] ||= facility[:office_name],
#       address: facility[:location_1][:human_address] ||= facility[:street_address_line_1] ||= facility[:address1],
#       phone: facility[:phone_number] ||= facility[:public_phone_number] ||= facility[:phone]
#     }
#     @all_facilities << Facility.new(facility_details)
#   end
# end
