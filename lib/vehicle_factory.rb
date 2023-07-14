class VehicleFactory
  attr_reader :vehicle_list
  def initialize
    @vehicle_list = []
  end

  def create_vehicles(data)
    data.each do |vehicle|
      #(vehicle) :ev
      @vehicle_list << Vehicle.new({
        vin: vehicle[:vin_1_10],
       year: vehicle[:model_year],
        make: vehicle[:make],
         model: vehicle[:model],
          engine: :ev
        })
    end
        #require 'pry';binding.pry

    #puts @vehicle_list.first.model
  end
end