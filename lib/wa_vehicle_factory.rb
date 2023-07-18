# require './lib/vehicle'

class VehicleFactory
  attr_reader :vehicles,
              :vin,
              :year,
              :make,
              :model,
              :engine

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
    attr_reader :vin_1_10,
                :dol_vehicle_id,
                :model_year,
                :make,
                :model,
                :engine
    
    def initialize(details)
      @vin_1_10 = details[:vin_1_10]
      @dol_vehicle_id = details[:dol_vehicle_id]
      @model_year = details[:model_year]
      @make = details[:make]
      @model = details[:model]
      @engine = :ev
    end
  end
end