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
