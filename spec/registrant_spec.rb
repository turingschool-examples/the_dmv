require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      expect(registrant_1).to be_an_instance_of(Registrant)
      expect(registrant_2).to be_an_instance_of(Registrant)
      #require 'pry';binding.pry
    end
  end

  it 'can return registrant_1 data' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to eq(true)
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it 'can return registrant_2 data' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    expect(registrant_2.name).to eq('Penny')
    expect(registrant_2.age).to eq(15)
    expect(registrant_2.permit?).to eq(false)
    expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it 'can earn a permit' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    expect(registrant_1.earn_permit).to eq(false)
    #registrant_1 already has a permit so it should return false for being able to earn a permit
    expect(registrant_2.earn_permit).to eq(true)
  end
end