class VehicleFactory

  def initialize

  end

  def create_vehicles
    vehicle_data = DmvDataService.new.wa_ev_registrations
    vehicles = []
    vehicle_data.each do |element|
      vehicles << Vehicle.new(element)
        # element[:engine],
        # element[:make],
        # element[:model],
        # element[:plate_type],
        # element[:registration_date],
        # element[:vin],
        # element[:year])
    end
    vehicles
  end

end