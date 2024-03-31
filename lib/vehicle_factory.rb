# require 'spec_helper'

class VehicleFactory
  attr_reader :filtered_data,
              :created_cars,
              :retrieved_data
              :@updated_data

  def initialize
    # @filter_keys = [:vin_1_10, :model_year, :make, :model, :engine]
    @filtered_data = nil
    @created_cars = []
#should dat be stored like this? Mainly for testing purposes but how to test w/o it?
    @retrieved_data = nil
    @updated_data = nil
  end


  def add_ev_engine(vehicle_info)
    vehicle_info.map do |vehicle_data|
      added_ev = vehicle_data[:engine] = :ev
      added_ev
# is there a better way to write this? implicit return is the added pair
    end
  end
        #  @filter_keys.include?(key)
        # is it best to update keys to match or change original keys to match data?
  def filter_data(registrations)
      retrieved_data = registrations.map do |hash|
        hash.select do |key, value|
          key == :make || key == :model || key == :model_year || key == :vin_1_10
        end
      end
      #still an array of hashes with vehicles info

      updated_data = retrieved_data.map do |vehicle_data|
        vehicle_data.map do |key, value|
          if key == :model_year
            key = :year
            {key => value}
          elsif key == :vin_1_10 
            key = :vin
            {key => value}
          else
            {key => value}
          end
          #turns to array of hashes separate hash w/one key
        end
      end
      combined_as_hash = {}
      # .reduce({}, :merge)
      @filtered_data = updated_data
      # @filtered_data = add_ev_engine(updated_data)
      
      # a.map do |key, value| if key == :model_year then key = :year elsif key == :vin_1_10 then key = :vin else key end
  end

  def create_vehicles(registrations)
    filter_data(registrations).map do |data|
      data.map do |car_data|
        new_cars = Vehicle.new(data)
        @created_cars << new_cars
      end
    end
  end

end



  # wa_ev_registrations = DmvDataService.new.wa_ev_registrations

# if [key] == name || key == make || key == model


# will have to use map instead of doing it on index 0
# vehicle_info = wa_ev_registrations[0].select {|key, value| 
#     key == :make || key == :model || key == :model_year || key == :vin_1_10}


