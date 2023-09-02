require './spec/spec_helper'

class Registrant
  attr_reader :name, :age, :permit
  attr_accessor :license_data
  def initialize(name, age, permit=false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written => false, :license => false, :renewed => false}
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end
end

# registrant_1 = Registrant.new('Bruce', 18, true )
# registrant_2 = Registrant.new('Penny', 16 )
# registrant_3 = Registrant.new('Tucker', 15 )
# facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
# facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})


# facility_1.add_service('Written Test')
# facility_1.add_service('Road Test')

# facility_1.administer_written_test(registrant_1)
# registrant_2.earn_permit
# facility_1.administer_written_test(registrant_2)
# facility_1.administer_road_test(registrant_1)
# facility_1.administer_road_test(registrant_2)
# binding.pry