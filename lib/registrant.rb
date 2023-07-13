class Registrant
  attr_reader :name, :age, :permit
  def initialize(name, age, permit = nil)
    @name = name
    @age = age
    @permit = permit
  end

  def permit?
    if @permit
      @permit
    else
      false
    end
  end

  def license_data
    {
      :written=>false,
      :license=>false,
      :renewed=>false
    }
  end

  def earn_permit
    @permit = true
  end
end