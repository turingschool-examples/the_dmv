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
    @list_of_offices = []
    offices.map do |office|
      address_data = office[:address_li], office[:address__1], office[:city], office[:state], office[:zip]
      full_address = address_data.join(" ")
      facility_details = { name: office[:dmv_office], address: full_address, phone: office[:phone]}
      @list_of_offices << facility_details
    end
    @list_of_offices
  end





  # def create_facility(facilities)
  #   new_facility = facilities.map do |facility|
  #     if facility[:state] == 'CO'
  #       facility_details = { name: facility[:dmv_office],
  #         address: facility[:address_li, :address__1, :city ,:state ,:zip], phone: facility[:phone] }
  #     end
  #     facility = Facility.new(facility_details)
  #   end

  # end
end

# facility_details = {name: facility[:dvm_office], address: facility[:addres_li + :address__1 + :city + :state + :zip], phone: facility[:phone]}