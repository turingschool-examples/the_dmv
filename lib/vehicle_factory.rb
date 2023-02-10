require 'spec_helper'

class VehicleFactory
  attr_reader :created_vehicles, :create_vehicles
  def initialize
    @created_vehicles = []
  end

  def create_vehicles(registrations)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    wa_ev_registrations.each do |car|
      @created_vehicles << (vehicle = Vehicle.new(car))
    end
    @created_vehicles
   
  end

end