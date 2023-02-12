class FacilitiesByState

  attr_reader :all_facilities, :or, :ny, :mo

  def initialize
    @or = []
    @ny = []
    @mo = []
    @all_facilities = [@or, @ny, @mo]
  end

    def create_facilities(state, data)
      if state.downcase == 'or'
        create_or_facilities(data)
      elsif state.downcase == 'ny'
        create_ny_facilities(data)
      elsif state.downcase == 'mo'
        create_ny_facilities(data)
      else 'Error, try again' 
      end
    end

    private
    def create_or_facilities(data)
      data.each do |facility|
        facility_details = {
          name: facility[:title], 
          address: facility[:location_1][:human_address],
          phone: facility[:phone_number]
        }
          @or << Facility.new(facility_details)
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
