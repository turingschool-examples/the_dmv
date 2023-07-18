require './lib/vehicle'

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
    end
  end
end