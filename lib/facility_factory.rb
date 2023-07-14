class FacilityFactory
  attr_reader :dmv_list
  def initialize
    @dmv_list = []
  end

  def find_facilities(data)
    #require 'pry';binding.pry
    data.each do |dmv|
      #(vehicle) :ev
      @dmv_list << Facility.new({
        name: dmv[:dmv_office],
         address: format_address(dmv[:address_li], dmv[:address__1]),
          phone: dmv[:phone]})
    end
        #require 'pry';binding.pry

    #puts @vehicle_list.first.model
  end

  def format_address(address1, address2)
    if address2 == nil
      "#{address1}"
    else
      "#{address1}, #{address2}"
    end
  end
end