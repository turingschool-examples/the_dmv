class FacilityFactory
  attr_reader :dmv_list
  def initialize
    @current_state = ""
    @dmv_list = []
  end

  def find_facilities(data)
    #require 'pry';binding.pry
    check_state(data.first[:state])
    data.each do |dmv|
      @dmv_list << Facility.new(
      if @current_state == "CO"
        {name: dmv[:dmv_office],
        address: format_co_address(dmv[:address_li], dmv[:address__1], dmv[:city], dmv[:state], dmv[:zip]),
        phone: dmv[:phone]}
      elsif @current_state == "NY"
        {name: dmv[:office_name],
        address: format_address(dmv[:street_address_line_1], dmv[:city], dmv[:state], dmv[:zip_code]),
        phone: dmv[:public_phone_number]}
      elsif @current_state == "MO"
        {name: dmv[:name],
        address: format_address(dmv[:address1], dmv[:city], dmv[:state], dmv[:zipcode]),
        phone: dmv[:phone]}
      else
        #default values to check for
      end
    )
    end
        #require 'pry';binding.pry

    #puts @vehicle_list.first.model
  end

  def check_state(state)
    @current_state = state
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
end