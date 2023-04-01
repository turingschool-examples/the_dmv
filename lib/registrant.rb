class Registrant
  attr_reader :name, :age, :permit, :license_data
  def initialize(name, age, permit = false, license_data = {:written => false, :license => false, :renewed => false} )
    @name = name
    @age = age
    @permit = permit
    @license_data = license_data
  end

  def permit?
    @permit
  end
  
  def license_data
    @license_data
  end

  def earn_permit
    if @age >= 16
      @permit = true
    else
      @permit = false
    end
  end

  
end