class Registrant
    attr_accessor :name,
                  :age,
                  :permit
    def initialize(name, age, permit = false)
        @name = name
        @age = name
        @permit = permit
    end
end





# class Registrant
# def initialize(name, age, premit)
# end

#Creating Registrant class so our vistors can use services.
# class Registrant
    # attr_accessor :name, 
    #               :age, 
    #               :permit, 
    #               :license_data
  
    # def initialize(name, age, permit = false)
    # @age = age
    # @name = name
    # @permit = permit
    # @license_data = {:written=>false, :license=>false, :renewed=>false}
    # end
#   end