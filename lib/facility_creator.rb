require 'date'

class FacilityCreator
  def initialize
    @new_facilities = []
  end

  def create_co_facilities(co_remote_data)
    co_remote_data.each do |data|
      facility = Facility.new({
        name:data[:dmv_office],
        address:"#{data[:address_li]}, #{data[:address__1]}, #{data[:city]}, #{data[:state]}, #{data[:zip]}",
        phone:data[:phone],
        services:data[:services_p],
        collected_fees:0,
        registered_vehicles:[]})
      @new_facilities << facility
    end
    @new_facilities
  end

  def create_ny_facilities(ny_remote_data)
    ny_remote_data.each do |data|
      facility = Facility.new({
        name:data[:office_name],
        address:"#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]}, #{data[:zip_code]}",
        phone:data[:public_phone_number],
        services:[],
        collected_fees:0,
        registered_vehicles:[]})
      @new_facilities << facility
    end
    @new_facilities
  end

  # def create_mo_facilities(mo_remote_data)
  #   mo_remote_data.each do |data|
  #     facility = Facility.new({
  #       name:data[:office_name],
  #       address:"#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]}, #{data[:zip_code]}",
  #       phone:data[:public_phone_number],
  #       services:[],
  #       collected_fees:0,
  #       registered_vehicles:[]})
  #     @new_facilities << facility
  #   end
  #   @new_facilities
  # end
end

