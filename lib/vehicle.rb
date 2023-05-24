class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type
          

  def initialize(vehicle_details)
  
    @engine = vehicle_details[:engine]
    @make = vehicle_details[:make ]
    @model = vehicle_details[:model]
     @vin = vehicle_details[:vin]
    @plate_type = vehicle_details[:plate_type]
    @registration_date = vehicle_details[:registration_date]
    @year = vehicle_details[:year]
 
  end

  def antique?
   date = Time.new
   date.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def change_plate
    if antique? == true
    @plate_type = :antique
    elsif electric_vehicle? == true
    @plate_type = :ev
    else
 @plate_type = :regular
    end
  end

  def change_date
    date = Time.new
   @registration_date = date
  end
  def register_vehicle(vehicle)
    vehicle.change_plate
    vehicle.change_date
    @registered_vehicles << vehicle
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    
  end
end

