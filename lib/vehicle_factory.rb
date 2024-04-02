class VehicleFactory
    def create_vehicles(dmv_data)
        dmv_data.map do |data|
            data[:vin] = data[:vin_1_10]
            data.delete(:vin_1_10)
            data[:year] = data[:model_year]
            data.delete(:model_year)
            data[:engine] = :ev
            Vehicle.new(data)
        end
    end

    def most_popular_makemodel(vehicles)
        makemodel_counter = Hash.new(0)
        vehicles.each do |vehicle|
            make_and_model = "#{vehicle.make} #{vehicle.model}"
            makemodel_counter[make_and_model] += 1
        end
        makemodel_counter.max_by { |key, value| value }[0]
        #[0] returns the key, [1] returns the value
    end

    def counter_by_model_year(vehicles)
        year_counter = Hash.new(0)
        vehicles.each do |vehicle|
            year_counter[vehicle.year] += 1
        end
        year_counter
    end
end

