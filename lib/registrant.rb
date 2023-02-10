class Registrant
  attr_reader :name, :age
  attr_accessor :license_data, :permit

  
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written => false, :license => false, :renewed => false}
  end

  def permit? 
    p @permit
  end

  # def license_data(written, license, renewed)
  #   #This is somehow a hash? HOW.
  # end

  def earn_permit
    if @permit == false
    @permit = true
    end
  end
end