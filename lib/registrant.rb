class Registrant
  attr_reader :name, :age
  attr_accessor :license_data, :permit, :written_test, :road_test

  
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written => false, :license => false, :renewed => false}
    @written_test = false
    @road_test = false
  end

  def permit? 
    @permit
  end

  # def license_data(written, license, renewed)
  #   #This is somehow a hash? HOW.
  # end

  def earn_permit
    if @permit == false
    @permit = true
    end
  end

  # def license_data 
  # end 
end