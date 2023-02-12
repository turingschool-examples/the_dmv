class VehicleFactory
  
  def initialize
  end

  def create_vehicles(dmv_registrations)
    DmvDataService.new.wa_ev_registrations
  end
end