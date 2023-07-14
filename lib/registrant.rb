class Registrant
  def initialize(age, license_data, name, permit = false)
    @age = age
    @license_data = #{:written, :license, :renewed}
    @name = name
    @permit = permit
  end
end
