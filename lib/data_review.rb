class DataReview
  attr_reader :facility

  def initialize(facility)
    @facility = facility
  end

  def find_popular_by_make
    makes = {}
    facility.registered_vehicles.each do |vehicle|
      if makes.keys.include?(vehicle.make)
        makes[vehicle.make]+=1
      else
        makes.merge!({vehicle.make => 1})
      end
    end
    makes = makes.sort_by{|key, value| -value}.to_h
    makes.first[0].capitalize + " is the most popular make at the #{@facility.name}"
  end

  def find_popular_by_model
    models = {}
    facility.registered_vehicles.each do |vehicle|
      if models.keys.include?(vehicle.model)
        models[vehicle.model]+=1
      else
        models.merge!({vehicle.model => 1})
      end
    end
    models = models.sort_by{|key, value| -value}.to_h
    models.first[0].capitalize + " is the most popular make at the #{@facility.name}"
  end

  def registered_vehicle_count_by_model_year(year)
    model_years = {}
    facility.registered_vehicles.each do |vehicle|
      if model_years.keys.include?(vehicle.year)
        model_years[vehicle.year]+=1
      else
        model_years.merge!({vehicle.year => 1})
      end
    end
    model_years[year].to_s + " registered vehicle(s) per the model year of #{year.to_s} at the #{@facility.name}"
  end
end
# binding.pry