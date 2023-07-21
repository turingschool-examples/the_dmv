class VehicleFactory
    attr_accessor :vehicle_list

    def initialize
        @vehicle_list = []
    end

    def create_vehicles(registrations)
      registrations.each do |vehicle|
        details = {
            vin: vehicle[:vin_1_10],
            year: vehicle[:model_year],
            make: vehicle[:make],
            model: vehicle[:model],
            county: vehicle[:county],
            engine: :ev
        }
        @vehicle_list << Vehicle.new(details)
      end
    end

    def most_popular_vehicle
      vehicle_hash = {}

      @vehicle_list.each do |vehicle|
        model = "#{vehicle.make} #{vehicle.model}"
        if vehicle_hash[model]
          vehicle_hash[model]+=1
        else 
          vehicle_hash[model]=1
        end
      end

      vehicle_hash.key(vehicle_hash.values.sort.last)
    end

    def count_registered_vehicle(input)
      @vehicle_list.count do |vehicle|
        vehicle.year == input
      end
    end

    def county_most_vehicles
      vehicle_hash = {}

      @vehicle_list.each do |vehicle|
        if vehicle_hash[vehicle.county]
          vehicle_hash[vehicle.county]+=1
        else 
          vehicle_hash[vehicle.county]=1
        end
      end

      vehicle_hash.key(vehicle_hash.values.sort.last)
    end
end