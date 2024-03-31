require './spec/spec_helper'

class FacilityFactory
  def initialize
  end

  def create_facilities(registrations)
    registrations.map do |hash|
      hash[:name] = 
        if hash[:dmv_office]
          hash.delete :dmv_office
        elsif hash[:office_name]
          hash.delete :office_name
        end
      hash[:address] = "#{hash[:address_li] }" + "#{hash[:office_name]}" + "#{hash[:address_1]}" + "#{hash[:street_address_line_1]}" + " #{hash[:city]}" + " #{hash[:state]}" + " #{hash[:zip]}" + "#{hash[:zip_code]}"
      # hash[:phone] = hash.delete :phone_number
      hash[:services] = if hash[:services_p]
        "Vehicle Registration" if hash[:services_p].include?("registration")
      end
      # hash[:services] = hash.delete hash[:services_p].map do |service|
      #   clean_services_data(service)
        # (".sub according services")
      
      Facility.new(hash)
    end
  end
end


  # def clean_services_data(service_string)
  #   services_array = service_string.gsub("registration", "Vehicle Registration").split(", ")
    
  #   if services_array.include?("Vehicle Registration")
  #     "Vehicle Registration"
  #   else
  #     nil
  #   end
  # end

  # def clean_address_data(array)
  # :address_li=>"2855 Tremont Place",
  # :address__1=>"Suite 118",
  # :city=>"Denver",
  # :state=>"CO",
  # :zip=>"80205",

  # "#{a[:address_li]}" + "#{a[:address_1]}" + " #{a[:city]}" + " #{a[:state]}" + " #{a[:zip]}"
  # "vehicle titles, registration, renewals;  VIN inspections"
  # a[:services_p].gsub("registration", "Vehicle Registration")
  # "vehicle titles, Vehicle Registration, renewals;  VIN inspections"
#   end
# end

  # colorado_facilities = DmvDataService.new.co_dmv_office_locations

  # a = colorado_facilities[0]
  # binding.pry
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