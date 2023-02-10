class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :collected_fees,
              :registered_vehicles


  def initialize(facility_info)
    @name = facility_info.fetch(:name)
    @address = facility_info.fetch(:address)
    @phone = facility_info.fetch(:phone)
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(current_vehicle)
    if @services.include?("Vehicle Registration")
      current_vehicle.registration_date = Time.now.strftime("%m/%d/%Y")
      @registered_vehicles << current_vehicle
      if current_vehicle.antique?
        @collected_fees += 25
      elsif current_vehicle.electric_vehicle?
        @collected_fees +=200
      else
        @collected_fees += 100
      end
    end
  end

  def administer_written_test(registrant)
    registrant.license_data[:written] = true if @services.include?("Written Test") && registrant.age >= 16 && registrant.permit? == true
  end
end


# The DMV allows facilities to perform the following services:
# Register a vehicle
# Vehicles have the following rules:
# Vehicles 25 years old or older are considered antique and cost $25 to register
# Electric Vehicles (EV) cost $200 to register
# All other vehicles cost $100 to register

# A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.

# Administer a written test
# A written test can only be administered to registrants with a permit and who are at least 16 years
# of age

# Administer a road test
# A road test can only be administered to registrants who have passed the written test
# For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
# Renew a driver’s license
# A license can only be renewed if the registrant has already passed the road test and earned a license