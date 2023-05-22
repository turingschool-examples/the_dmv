class Registrant

  attr_reader :name,
              :age,
              :license_data

  attr_accessor :permit

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

  def pass_test
    if age >= 16 && permit == true
      @license_data[:written] = true
    end
  end



end
