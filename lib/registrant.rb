class Registrant
    attr_reader :name, :age, :license_data, :permit
  
    def initialize(name, age, has_permit = false)
      @name = name
      @age = age
      @license_data = { written: false, license: false, renewed: false }
      @permit = has_permit
    end

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