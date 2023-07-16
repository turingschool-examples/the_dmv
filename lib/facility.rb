class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(new_vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << new_vehicle
      new_vehicle.registration_date = Date.today
      if new_vehicle.antique?
        @collected_fees += 25
        new_vehicle.plate_type = :antique
      elsif new_vehicle.electric_vehicle?
        @collected_fees += 200
        new_vehicle.plate_type = :ev
      else
        @collected_fees += 100
        new_vehicle.plate_type = :regular
      end
      @registered_vehicles
    end
  end
  # def collected_fees
  #   fees = 0
  #   years_old = 2023 - @year
  #   if years_old >= 25
  #     fees += 25
  #   elsif @engine == :ev
  #     fees += 200
  #   else
  #     fees += 100
  #   end
  #   fees
  # end
end
