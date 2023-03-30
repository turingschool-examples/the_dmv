require 'spec_helper'

RSpec.describe Registrant do
  describe "Iteration 1" do
    it "exists" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1).to be_a(Registrant)
      expect(registrant_2).to be_a(Registrant)
    end
  end
end


# pry(main)> registrant_1.name
# #=> "Bruce"

# pry(main)> registrant_1.age
# #=> 18

# pry(main)> registrant_1.permit?
# #=> true

# pry(main)> registrant_1.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# pry(main)> registrant_2.name
# #=> "Penny"

# pry(main)> registrant_2.age
# #=> 15

# pry(main)> registrant_2.permit?
# #=> false

# pry(main)> registrant_2.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# pry(main)> registrant_2.earn_permit

# pry(main)> registrant_2.permit?
# #=> true