require 'spec_helper'
require './lib/registrant'
require './lib/facility'


RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Registrant do
    before (:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)  
      @registrant_2 = Registrant.new('Penny', 15)
      @registrant_3 = Registrant.new('Tucker', 15)
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

    describe '#initialize' do
        it 'can initialize with attributes' do
            expect(@registrant_1).to be_an_instance_of(Registrant)
            expect(@registrant_2).to be_an_instance_of(Registrant)
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_1.permit).to eq(true)
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(@registrant_2.name).to eq('Penny')
            expect(@registrant_2.age).to eq(15)
            expect(@registrant_2.permit).to eq(false)
            expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            
        end
    end

    describe '#permit?' do
        it 'checks if registrant has a permit' do
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.permit?).to eq(false)
        end
    end

    describe '#earn_permit' do
        it 'changes permit status' do
            expect(@registrant_2.permit?).to eq(false)
            @registrant_2.earn_permit 
            expect(@registrant_2.permit?).to eq(true)
        end
    end

    describe '#written test' do
        it 'administer a written test' do

        end

    end
end















# pry(main)> registrant_1 = Registrant.new('Bruce', 18, true )
# #=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

# pry(main)> registrant_2 = Registrant.new('Penny', 15 )
# #=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

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