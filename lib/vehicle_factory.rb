require 'spec_helper'
class VehicleFactory
  attr_reader :vehicle
  def initialize
    @vehicles = []
  end

  def create_vehicles(wa_ev_registrations)
    @vehicles << wa_ev_registrations
  end
end