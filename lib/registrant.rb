class Registrant
  attr_reader :name,
              :age,
              :permit,
              :license_data
  
  def initialize(name, age, permit = false)
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

  def qualifies_for_written_test?
    if @permit == true && age >= 16
      return true
    end
  end

  def qualifies_for_road_test?
    if @license_data[:written] = true 
      return true
    else
      false
    end

  end



    # A road test can only be administered to registrants who have passed the written test
end