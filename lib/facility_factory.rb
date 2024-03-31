class FacilityFactory
    def initialize
    end
  
    def create_facilities(registrations)
      registrations.map do |hash|
        hash[:year] = hash.delete :model_year
        hash[:vin] = hash.delete :vin_1_10
        hash[:engine] = :ev
        Facility.new(hash)
      end
    end
  end

collect data
update keys
update name key
update address
  concatonate values
  assign to address

phone is already good
update services from services_p
  capitalize each

build
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