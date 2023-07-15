class Registrant
attr_reader :name, :age, :permit?, :license_data

  def initialize(age, name, permit? = false)
    @age = age
    @license_data = {:written, :license, :renewed}
    @name = name
    @permit? = permit?
    @tested = false
  end

  def earn_permit
# Changes permit? to false
  end


end
