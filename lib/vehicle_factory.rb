class VehicleFactory

    def initialize
    end

    def create_vehicles(registrations)
        # details_to_select = [:vin_1_10, :model_year, :make, :model, :engine=>'ev']
        # car_details_needed = registrations.map do |registration|
        #     registration.select {|detail, _| details_to_select.include?(detail)}
        # end
        # car_details = car_details_needed.map do |car|
        #     car.to_a
        #     car.flatten
        # end
        registrations.map do |registration|
            Vehicle.new({
            vin: registration[:vin_1_10],
              year: registration[:model_year],
              make: registration[:make],
              model: registration[:model],
              engine: :ev
            })
        end
        # binding.pry
    end
end