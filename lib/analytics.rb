class Analytics
    attr_accessor :vehicles

# Find the most popular make/model registered
    def most_popular_make
        array_grouped_by_make = @vehicles.group_by do |vehicle|
            vehicle.make
        end
        most_popular_make = array_grouped_by_make.max_by do |pair, occurrences|
            occurrences.size
        end
        most_popular_make
    end    
        # array_of_makes = @vehicles.map do |vehicle|
        #     vehicle[:make]
        # end
        

# sort by [:make], shovel into an empty array, return
# need to return value of make key
    

    def most_popular_model
# sort by [:model], shovel into an empty array, return
    end
# Count of registered vehicle for a model year
    def count_vehicles_for_model_year
# sort by [:model_year], shovel into an empty array, count elements?
    end
# County with most registered vehicles
    def county_with_most_vehicles
        # use #create_vehicles to make a factory, search the [:county] or something
    end

end

