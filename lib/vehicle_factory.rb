
class VehicleFactory
  attr_accessor :most_popular_make_model,
                :most_common_year,
                :years,
                :most_common_county
               

  def initialize
    @most_popular_make_model = ""
    @most_common_year = ""
  end

  def create_vehicles(input_api)
    created_vehicles = []
    if input_api.first[:state_of_residence] == "WA"
      input_api.each do |hash|
        hash_final = {}
        hash_final[:vin] = hash[:vin_1_10]
        hash_final[:year] = hash[:model_year]
        hash_final[:make] = hash[:make]
        hash_final[:model] = hash[:model]
        hash_final[:engine] = :ev
        created_vehicles << Vehicle.new(hash_final)
      end
    elsif input_api.first[:"state"] == "NY"
      input_api.each do |hash|
        if hash[:"record_type"] == "VEH"
          hash_final = {}
          hash_final[:vin] = hash[:vin]
          hash_final[:year] = hash[:model_year]
          hash_final[:make] = hash[:make]
          hash_final[:model] = hash[:body_type]
          hash_final[:engine] = hash[:fuel_type]
          created_vehicles << Vehicle.new(hash_final)
          require 'pry'; binding.pry
        end
      end
    end


  # find the most popular make/model
    all_makes_models = []
    created_vehicles.each do |vehicle|
      make_model = []
      make_model << "#{vehicle.make}, #{vehicle.model}"
      all_makes_models << make_model
    end
        
    models_count = Hash.new(0)
    all_makes_models.each do |model| 
      models_count[model] += 1
    end
    @most_popular_make_model = (models_count.sort_by { |model,number| number}.last[0]).join
    
  #find count of registered vehicles for a given year
    all_years = []
    created_vehicles.each do |vehicle|
      all_years << vehicle.year.to_i
    end
        
    years_count = Hash.new(0)
    all_years.each do |year|
      years_count[year] += 1
    end

    @years = years_count
    @most_common_year = years_count.sort_by {|year, number| number}.last[0]
      
  #calculates most common county attribute
    total_counties = []
    input_api.each do |hash|
      total_counties << hash[:county]
    end

    counties_count = Hash.new(0)
    total_counties.each do |county|
      counties_count[county] += 1
    end

    @most_common_county = counties_count.sort_by {|county, number| number}.last[0]
  #last line of method return:
    created_vehicles
  end


  def year_counter(given_year)
    @years[given_year]
  end
end