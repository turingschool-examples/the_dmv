require "./lib/registrant"


RSpec.describe Registrant do

    it 'can initialize' do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
     
    expect(@registrant_1).to be_an_instance_of(Registrant)
    expect(@registrant_2).to be_an_instance_of(Registrant)
    end

    it '#permit?' do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)

    expect(@registrant_1.permit).to eq true
    expect(@registrant_2.permit).to eq false
    end

    it "#earn_permit" do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
    @registrant_2.earn_permit

    expect(@registrant_2.permit?).to eq true
    end

end