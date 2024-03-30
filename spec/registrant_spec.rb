require 'spec_helper'

RSpec.configure do |config|
      config.formatter = :documentation
end

RSpec.describe Dmv do
  before(:each) do
    @dmv = Dmv.new
    @registrant_1 = Registrant.new({name: 'Bruce', age: 18, permit: true, :license_data})
    @registrant_2 = Registrant.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_3 = Facility.new({name: 'DMV Northwest Branch', address: '3698 W. 44th Avenue Denver CO 80211', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
    end