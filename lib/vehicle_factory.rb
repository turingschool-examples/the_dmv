class VehicleFactory
  attr_reader :vehicle_list
  def initialize
    @vehicle_list = []
  end

  def create_vehicles(data)
    data.each do |vehicle|
      @vehicle_list << Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        county: vehicle[:county],
        engine: :ev
        
      })
    end
  end

  def most_popular_registered_make
    make_count = Hash.new(0)
    @vehicle_list.each {|car| make_count[car.make] += 1}
    make_count.sort_by { |make,number| number}.last[0]
  end

  def most_popular_registered_model
    model_count = Hash.new(0)
    @vehicle_list.each {|car| model_count[car.model] += 1}
    model_count.sort_by { |model,number| number}.last[0]
  end

  def most_popular_registered_year
    year_count = Hash.new(0)
    @vehicle_list.each {|car| year_count[car.year] += 1}
    year_count.sort_by { |year,number| number}.last[0]
  end

  def most_popular_registered_county
    county_count = Hash.new(0)
    @vehicle_list.each {|car| county_count[car.county] += 1}
    county_count.sort_by { |county,number| number}.last[0]
  end
end