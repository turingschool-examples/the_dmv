class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(registrations)
    # if registrations == wa_ev_registrations
      registrations.each do |vehicle|
        details = {
          engine: :ev,
          make: vehicle[:make],
          model: vehicle[:model],
          plate_type: vehicle[:plate_type],
          registration_date: vehicle[:registration_datel],
          vin: vehicle[:vin_1_10],
          year: vehicle[:model_year]
        }
        @vehicles << Vehicle.new(details)
      end
    # end
    #is it ok to keep multiples? many duplicates
    # require 'pry';binding.pry
  end

end
