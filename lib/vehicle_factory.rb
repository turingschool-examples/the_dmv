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

  def create_other_vehicles(data)
    data.each do |vehicle|
      @vehicle_list << Vehicle.new({
        vin: vehicle[:vin],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:record_type],
        county: vehicle[:county],
        engine: :ev
      })
    end
  end

  def most_popular_registered_make
    #Note to help with confusion
    #Last is the highest incremented in the returned array,
    #0 is the key,in this case make of car
    #This note applies to all most_popular methods
    make_count = Hash.new(0)
    @vehicle_list.each do |car|
       make_count[car.make] += 1
    end
    make_count.sort_by do |make,number| 
      number
    end.last[0]
  end

  def most_popular_registered_model
    model_count = Hash.new(0)
    @vehicle_list.each do |car| 
      model_count[car.model] += 1
    end
    model_count.sort_by do |model,number|
      number
    end.last[0]
  end

  def most_popular_registered_year
    year_count = Hash.new(0)
    @vehicle_list.each do |car| 
      year_count[car.year] += 1
    end
    year_count.sort_by do |year,number|
       number
    end.last[0]
  end

  def most_popular_registered_county
    county_count = Hash.new(0)
    @vehicle_list.each do |car|
      county_count[car.county] += 1
    end
    county_count.sort_by do |county,number| 
      number
    end.last[0]
  end

  def model_count(selected_year)
    car_year = @vehicle_list.find_all do |vehicle|
      vehicle.year == selected_year
    end
    car_year.length
  end
end