class Registrant
   attr_reader :name,
               :age,
               :license_data

   def initialize(name, age, give_permit = false)
      @name = name
      @age = age
      @permit = give_permit
      @license_data = {:written=>false, :license=>false, :renewed=>false}
   end

   def permit?
      @permit
   end

   def earn_permit
      @permit == false ? @permit = true : @permit
   end
end