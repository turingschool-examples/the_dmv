class Registrant
    attr_reader :name, :age, :license_data, :permit
  
    def initialize(name, age, has_permit = false)
      @name = name
      @age = age
      @license_data = { written: false, license: false, renewed: false }
      @permit = has_permit
    end

    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end# Arrays
    # - Ordered List 
    # - Can hold any data type 
    # - Uses square brackets
    # - use index to acces elements
    
    
    # Hashes
    # - Unordered List 
    # - Uses Key/value pairs 
    # - Uses curly brackets
    # - Can also hold any data type 
    # - use keys to access values
    # - keys will always be unique
  end
  

# class Registrant
#     attr_reader :name,
#                 :age,
#                 :license_data,
#                 :permit

#     def initialize(registrant_details)
#         @name = registrant_details[:name]
#         @age = registrant_details[:age]
#         @license_data = {:written => false, :license => false, :renewed => false}
#         @permit = false
#     end
# end