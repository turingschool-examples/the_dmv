require './lib/vehicle'
require './lib/dmv_data_service'

class VehicleFactory
  def create_vehicles(vehicles)
    vehicles.map do |vehicle|
      Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      })
    end
  end

  # Not part of the official requirements.
  # I was just experimenting gathering specific data.
  def vehicles_by_make(vehicles)
    make_inventory = {}
    vehicles.each do |vehicle|
      if make_inventory[vehicle[:make]] == nil
        make_inventory[vehicle[:make]] = 1
      else
        make_inventory[vehicle[:make]] += 1
      end
    end
    make_inventory
  end

end
