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
    
  end

  def registered_vehicle_count_by_model
    #Similar approach ising hashes
  end
end

binding.pry