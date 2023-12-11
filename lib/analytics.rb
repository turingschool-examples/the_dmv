class Analytics
   
   def initialize
      @vehicle_models = []
      @vehicle_makers = []
   end

   def vehicle_models(vehicles)
      vehicles.each do |vehicle|
         @vehicle_models << vehicle.model
      end
      @vehicle_models
   end

   def model_count(vehicles)
      vehicle_models(vehicles)
      @vehicle_models.tally
   end

   def most_popular_model(vehicles)
      most_popular_model = model_count(vehicles).max_by do |model, count|
         count
      end
      most_popular_model
   end

   def vehicle_maker(vehicles)
      vehicles.each do |vehicle|
         @vehicle_makers << vehicle.make
      end
      @vehicle_makers
   end

   def make_count(vehicles)
      vehicle_maker(vehicles)
      @vehicle_makers.tally
   end

   def most_popular_make(vehicles)
      most_popular_make = make_count(vehicles).max_by do |make, count|
         count
      end
      most_popular_make
   end

   def count_by_year(vehicles, year)
      selected_vehicles = vehicles.select { |vehicle| vehicle.year == year }
      selected_vehicles.count
   end
end