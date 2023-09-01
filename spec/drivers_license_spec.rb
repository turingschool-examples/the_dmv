require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1.add_service('Vehicle Registration')
  end
  
  it 'can obtain license data' do
    expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(@registrant_1.permit?).to eq(true)
  end

  it 'cannot administer a written test for registrant 1' do
    expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
  end
  
  it 'can administer a written test for registrant 1' do
    @facility_1.add_service('Written Test')
    #require 'pry';binding.pry
    expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
  end
end