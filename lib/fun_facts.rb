class FunFacts

    def initialize
    end

    def most_popular_make(api)
        make_counts = api.map do |car|
            make_counts.tally
        end        
        most_popular_make = make_counts.max_by do |make, count|
            most_popular_make.count
        end
        most_popular_make = most_popular_make.first
        most_popular_make
    end

end
