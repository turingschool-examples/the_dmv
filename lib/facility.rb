class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles 

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

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') == true
      vehicle.registration_date = Date.today

      @registered_vehicles << vehicle
    end
  end
end

  # def plate_type
  #   if @registration_date != nil && antique? == true
  #     return :antique
  #   elsif @registration_date != nil && electric_vehicle? == true
  #     return :ev
  #   elsif @registration_date != nil
  #     :regular
  #   else
  #     nil
  #   end
  # end


# def pay_fee
#   if vehicle.vehicle_details[:year] == Date.today.year - @year > 25
#     @collected_fees += 25
#   elsif vehicle.vehicle_details[:engine] == :ev
#     @collected_fees += 200
#   else 
#     @collected_fees +=100
#   end
# end
# end
