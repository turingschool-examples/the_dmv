class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(wa_ev_registrations)
    wa_ev_registrations.each do |reg|
      @vehicles << Vehicle.new(reg)
    end
    @vehicles
  end

  private

  class Vehicle
    attr_accessor :registration_date
    attr_reader :engine,
                :make,
                :model,
                :plate_type,
                :vin,
                :year,
                :electric_vehicle_type,
                :vin_1_10,
                :dol_vehicle_id,
                :model_year
    
    def initialize(details)
      @engine = :ev
      @make = details[:make]
      @model = details[:model]
      @plate_type = details[:plate_type]
      @registration_date = details[:registration_date]
      @vin = details[:vin]
      @electric_vehicle_type = details[:electric_vehicle_type]
      @vin_1_10 = details[:vin_1_10]
      @dol_vehicle_id = details[:dol_vehicle_id]
      @model_year = details[:model_year]
    end
  end
end