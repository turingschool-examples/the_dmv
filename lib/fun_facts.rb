class FunFacts

    def initialize
    end

    def most_popular_make(api)
        makes = api.map do |car|
            car[:make]
        end    
        make_counts = makes.tally

        most_popular_make = make_counts.max_by do |make, count|
            most_popular_make.count
        end
        most_popular_make.first        
    end

end
