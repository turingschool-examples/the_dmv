class Registrant
  attr_reader :name,
              :age,         # getter method
              :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit # Do I need a separate method to define this?
    @license_data = {:written => false, :license => false, :renewed => false}
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true  
  end

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

