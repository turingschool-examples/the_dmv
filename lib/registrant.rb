class Registrant
  attr_reader :name,
              :age,         # getter method
              :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written => false, :license => false, :renewed => false}
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true  # should there be functionality in here to check age >= 16? (if)
  end

    # def written_test_pass
    #   @license_data[:written] = true
    # end

end

# registrant_1 --> has a permit
#                  will pass written test
#                  will pass road test
#                  receives license 
#                  will renew license

# registrant_2 --> will pass written test
#                  will pass road test
#                  receives license
#                  will renew license

# registrant_3 --> will not pass written test
#                  will not receive permit/license/road test - nothing

