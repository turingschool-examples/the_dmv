class Registrant
attr_reader :name, :age, :license_data
  def initialize(name, age, permit=false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

  # def administer_written_test(registrant)
  #   return false unless @services.include?("Written Test")
      
  #     if registrant.age >= 16 && registrant.permit? == true
  #       @license_data = {:written=>true, :license=>false, :renewed=>false}
  #     end
    
  # end

end