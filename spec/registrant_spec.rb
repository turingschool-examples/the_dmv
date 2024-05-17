require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Registrant do
  before(:each) do

    @registrant_1 = Registrant.new('Bruce', 18, true )
    # pry(main)> registrant_1 = Registrant.new('Bruce', 18, true )
    # #=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>
    
    @registrant_2 = Registrant.new('Penny', 15 )
    # pry(main)> registrant_2 = Registrant.new('Penny', 15 )
    # #=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>
    
  end

  it "can initialize" do
    expect(@registrant_1).to be_an_instance_of(Registrant)
    expect(@registrant_2).to be_an_instance_of(Registrant)
  end

  it "has a name" do
    expect(@registrant_1.name).to eq("Bruce")
    # pry(main)> registrant_1.name
    # #=> "Bruce"
    
    expect(@registrant_2.name).to eq("Penny")
    # pry(main)> registrant_2.name
    # #=> "Penny"
  end
  
  it "has an age" do
    expect(@registrant_1.age).to eq(18)
    # pry(main)> registrant_1.age
    # #=> 18
    
    expect(@registrant_2.age).to eq(15)
    # pry(main)> registrant_2.age
    # #=> 15
  end

  it "can have a permit (#permit?)" do
    expect(@registrant_1.permit?).to be(true)
    # pry(main)> registrant_1.permit?
    # #=> true

    expect(@registrant_2.permit?).to be(false)  # I think #permit? defaults to false >> check IP for age requirements, etc.
    # pry(main)> registrant_2.permit?
    # #=> false
  end

  it "can earn a permit (#earn_permit)" do   # FROM IP: "There is no age limit to when someone can earn their permit."
    expect(@registrant_2.permit?).to be(false)
    
    @registrant_2.earn_permit
    # pry(main)> registrant_2.earn_permit
    
    expect(@registrant_2.permit?).to be(true)
    # pry(main)> registrant_2.permit?
    # #=> true
  end
  
  it "has license data" do
    expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    # pry(main)> registrant_1.license_data
    # #=> {:written=>false, :license=>false, :renewed=>false}
    
    expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    # pry(main)> registrant_2.license_data
    # #=> {:written=>false, :license=>false, :renewed=>false}
  end
  
end

