class Registrant

  attr_reader :name,
              :age,
              :license_data

  attr_accessor :permit

  #license data did not work with own method
  #data better outside of init but works here
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {
      :written => false,
      :license => false,
      :renewed => false
    }
  end

  def permit?
    permit
  end

  #move to init
  # def license_data
  #   @license_data = {
  #           :written => false,
  #           :license => false,
  #           :renewed => false
  #         }
  # end

  def earn_permit
    @permit = true
  end

  #check for conditions
  def pass_test
    @license_data[:written] = true if age >= 16 && permit == true
  end

  def earn_license
    @license_data[:license] = true if @license_data[:written] == true
  end

  def renew_license
    @license_data[:renewed] = true if @license_data[:license] == true
  end

  #end class
end
