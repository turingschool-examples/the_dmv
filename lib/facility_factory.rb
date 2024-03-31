require './spec/spec_helper'

class FacilityFactory
  def initialize
  end

  def create_facilities(registrations)
    registrations.map do |hash|
      hash[:name] = hash.delete :dmv_office
      # hash[:address] = hash.delete ***:concatonate
      hash[:services] = hash.delete :services_p.map do |service|
        clean_services_data(service)
        # (".sub according services")
      end
      Facility.new(hash)
    end
  end


  def clean_services_data(service_string)
    services_array = service_string.gsub("registration", "Vehicle Registration").split(", ")
    
    if services_array.include?("Vehicle Registration")
      "Vehicle Registration"
    else
      nil
    end
  end

  def clean_address_data(array)
  # :address_li=>"2855 Tremont Place",
  # :address__1=>"Suite 118",
  # :city=>"Denver",
  # :state=>"CO",
  # :zip=>"80205",

  # colorado_facilities = DmvDataService.new.co_dmv_office_locations

  # a = colorado_facilities[0]
  # binding.pry
  # a[:services_p]
  # "vehicle titles, registration, renewals;  VIN inspections"
  # a[:services_p].gsub("registration", "Vehicle Registration")
  # "vehicle titles, Vehicle Registration, renewals;  VIN inspections"
  end
end
# build
  #class reference **********
#   class Facility
#     attr_reader :name,
#                 :address,
#                 :phone,
#                 :services,
#                 :registered_vehicles,
#                 :collected_fees
  
#     def initialize(facility_data)
#       @name = facility_data[:name]
#       @address = facility_data[:address]
#       @phone = facility_data[:phone]
#       @services = []
#       @registered_vehicles = []
#       @collected_fees = 0
#     end
# facility {name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})