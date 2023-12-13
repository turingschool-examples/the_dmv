require './lib/vehicle'

class Registrant
    attr_reader :name, 
                :age, 
                :permit,
                :license_data,
                :vehicles,
                :year
    attr_accessor :balance
    def initialize(name, age, permit = false)
        @name = name 
        @age = age
        @permit = permit
        @year = year
        @license_data = {:written=>false, :license=>false, :renewed=>false}
        @vehicles = []
        @balance = 0
        @antique = antique?
        @ev_vehicle = electric_vehicle?
    end

    def permit?
        @permit 
    end
    
    
    def earn_permit
        @permit = true
    end

    def add_vehicle(vehicle)
        @vehicles << vehicle
    end
    def balance
      @balance = 0    
         if @vehicle.antique?
          25
        if @vehicle.electric_vehicle?
        200
        else
       100
        end
    end
   
    def antique?
      @year && @year >= 1998
    end
    
    def electric_vehicle?
        @engine == :ev
    end
    end
end