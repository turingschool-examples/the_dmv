require 'rspec'
require 'spec_helper'

RSpec.describe Registrant do
  let(:registrant_1) {Registrant.new('Bruce', 18, true )}
  let(:registrant_2) {Registrant.new('Penny', 15 )}
  
  it 'exist' do
    expect(registrant_1).to be_a Registrant
    expect(registrant_2).to be_a Registrant
  end

  it 'registrant has a name' do 
    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_2.name).to eq("Penny")
  end

  it 'registrant has an age' do
    expect(registrant_1.age).to eq(18)
    expect(registrant_2.age).to eq(15)
  end

  it 'registrant has a permit' do
    expect(registrant_1.permit?).to be true
    expect(registrant_2.permit?).to be false
  end

  it 'registrants have liscene data' do
    expect(registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
    expect(registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
  end

  it 'registrants can earn a permit' do
    registrant_2.earn_permit

    expect(registrant_2.permit?).to be true
  end








end