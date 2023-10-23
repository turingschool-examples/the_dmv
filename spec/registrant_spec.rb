require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    #Iteration2
    @registrant_3 = Registrant.new('Tucker', 15 )
  end
  
  it 'can initialize' do
    expect(@registrant_1).to be_an_instance_of(Registrant)
    expect(@registrant_2).to be_an_instance_of(Registrant)
  end

  it 'can method name' do
    expect(@registrant_1.name).to eq("Bruce")
    expect(@registrant_2.name).to eq("Penny")
  end
  
  it 'can method age' do
    expect(@registrant_1.age).to eq(18)
    expect(@registrant_2.age).to eq(16)
  end
  
  it 'can method permit' do
    expect(@registrant_1.permit?).to eq(true)
    expect(@registrant_2.permit?).to eq(false)
  end
  
  it 'can hash license_data' do
    expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end
  
  it 'can earn_permit' do
    @registrant_2.earn_permit
    
    expect(@registrant_2.permit?).to eq(true)
  end
  
  #Iteration2-Getting a Drivers License **ALL THAT FOLLOWS BELOW**
  it 'can hash license_data' do
    expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end
  
  it 'can method permit' do
    expect(@registrant_1.permit?).to eq(true)
  end
  
  it 'can modify license_data' do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1.add_service('Written Test')
    @facility_1.administer_written_test(@registrant_1)

    expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
  end
  
  it 'can method age and method permit' do
    expect(@registrant_2.age).to eq(16)
    expect(@registrant_2.permit?).to eq(false)
    expect(@registrant_3.age).to eq(15)
    expect(@registrant_3.permit?).to eq(false)
  end
  
  it 'confirms no road test administered' do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1.administer_road_test(@registrant_3)
    @registrant_3.earn_permit

    expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end


end