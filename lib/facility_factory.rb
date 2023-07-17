class FacilityFactory
  attr_reader :dmv_list
  def initialize
    @current_state = ""
    @dmv_list = []
  end

  def find_facilities(data)
    @current_state = data.first[:state]
    data.each do |dmv|
      @dmv_list << Facility.new(
      if @current_state == "CO"
        {
          name: dmv[:dmv_office],
        address: format_co_address(dmv[:address_li], dmv[:address__1], dmv[:city], dmv[:state], dmv[:zip]),
        phone: dmv[:phone],
        open_hours: dmv[:hours]
      }
      elsif @current_state == "NY"
        {
          name: dmv[:office_name],
        address: format_address(dmv[:street_address_line_1], dmv[:city], dmv[:state], dmv[:zip_code]),
        phone: dmv[:public_phone_number],
        open_hours: format_ny_open_hours(
          dmv[:monday_beginning_hours], dmv[:monday_ending_hours],
           dmv[:tuesday_beginning_hours], dmv[:tuesday_ending_hours],
            dmv[:wednesday_beginning_hours], dmv[:wednesday_ending_hours],
             dmv[:thursday_beginning_hours], dmv[:monday_ending_hours],
              dmv[:friday_beginning_hours], dmv[:friday_ending_hours])
            }
      elsif @current_state == "MO"
        {
          name: dmv[:name],
        address: format_address(dmv[:address1], dmv[:city], dmv[:state], dmv[:zipcode]),
        phone: dmv[:phone],
        open_hours: format_mo_open_hours(dmv[:daysopen], dmv[:holidaysclosed])
      }
      else
        #default values to check for
      end
    )
    end
    require 'pry';binding.pry
  end

  def format_co_address(address1, address2, city, state, zip)
    if address2 == nil
      "#{address1} #{city} #{state} #{zip}"
    else
      "#{address1} #{address2} #{city} #{state} #{zip}"
    end
  end

  def format_address(address, city, state, zip)
      "#{address} #{city} #{state} #{zip}"
  end

  def format_ny_open_hours(mon_start, mon_end,
     tues_start, tues_end,
      wed_start, wed_end,
       thurs_start, thurs_end,
        fri_start, fri_end)
    "Monday: #{mon_start} to #{mon_end}, Tuesday: #{tues_start} to #{tues_end}, Wednesday: #{wed_start} to #{wed_end}, Thursday: #{thurs_start} to #{thurs_end}, Friday: #{fri_start} to #{fri_end}"
  end

  def format_mo_open_hours(open_hours, holidays)
    "Open: #{open_hours}, Closed: #{holidays}"
  end
end