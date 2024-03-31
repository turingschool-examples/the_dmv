require 'spec_helper.rb'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )

  end

  it 'can initialize' do
    expect(@registrant_1).to be_an_instance_of(Registrant)
  end

  it 'has a name, age, and permit status' do
    expect(@registrant_1.name).to eq('Bruce')
    expect(@registrant_1.age).to eq(18)
    expect(@registrant_1.permit?).to eq(true) # Shouldn't this override the false?
    expect(@registrant_2.name).to eq('Penny')
    expect(@registrant_2.age).to eq(15)
    expect(@registrant_2.permit?).to eq(false)
  end

  it 'has license data' do
    expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
    expect(@registrant_2.license_data).to eq({:written => false, :license => false, :renewed => false})
  end

  it 'can earn their permit' do
    expect(@registrant_2.permit?).to eq(false)

    @registrant_2.earn_permit
    
    expect(@registrant_2.permit?).to eq(true)
  end
end