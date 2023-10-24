class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = []
  end

  def create_vehicles(state_registration)
    @created_vehicles = state_registration.map do |vehicle|
      Vehicle.new(
        vin: vehicle[:vin_1_10], 
        year: vehicle[:model_year], 
        make: vehicle[:make], 
        model: vehicle[:model], 
        engine: :ev)
    end 
  end

  #Iteration4 
  # def nada_surf
  #   popular = DmvDataService.new.wa_ev_registrations
  #   #popular.tally.map { |k, v| k.merge({count: v}) }
  #   #popular.tally[:make]
  #   #popular.group_by(&:itself).map { |k, v| k.merge(count: v.length)}
  #   popular.group_by(&:itself). # this produces a structure like: {"the"=>["the", "the"], "be"=>["be", "be"], ... }
  #     map { |k, v| [k, v.count] }.to_h
  #   end
  # end

  # def nada_surf(data_type)
  #   @created_vehicles.grep(data_type)
  # end
  # #returns {[]=>0}
  # def nada_surf
  #   [@created_vehicles[:make]].each_with_index.to_h
  # end

  #returns empty hash
  # def nada_surf(data_type)
  #   @created_vehicles.tally
  # end

  #only counts each one once
  # def nada_surf(data_type)
  #   popular = Hash.new(0)
  #   @created_vehicles.each do |num|
  #     popular[num] += 1
  #   end
  #     popular.each do |datum, num|
  #     puts "They got a #{datum} which appears the most times, #{num} times, so they're POPULAR!"
  #   end
  # end

  #returns nil
  # def nada_surf(data_type)
  #   popular = @created_vehicles.inject(Hash.new(0)) { |datum, num| datum[num] +=1; datum } 
  #   @created_vehicles.max_by { |num| popular[num] }
  # end
end