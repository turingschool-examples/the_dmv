require 'date'

class FacilityCreator
  def initialize
    @new_facilities = []
  end

  def create_facilities(remote_data)
    remote_data.each do |data|
      facility = Facility.new{
        name:data[:dmv_office],
        address:"#{data[:address_li]}, #{data[:address__1]}, #{data[:city]}, #{data[:state]}, #{data[:zip]}",
        phone:data[:phone],
        services:data[:services_p],
        collected_fees:0,
        registered_vehicles:[]}
      @new_facilities << facility
    end
    @new_facilities
  end
end

