class Registrant
  attr_reader :name, :age, :license_data, :permit

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @license_data = {:written => false, :license => false, :renewed => false}
    @permit = permit
  end

  def permit?
    @permit
  end

  def earn_permit
    if @permit == false
      @permit = true
    end
  end
end