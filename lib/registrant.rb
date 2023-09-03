class Registrant
  attr_accessor :name,
                :age,
                :license_data
                :permit
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {written: false, license: false, renewed: false}
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