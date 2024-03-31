class MostPopularFinder
    attr_reader :factory
    
    def initialize
        @factory = VehicleFactory.new
    end
end