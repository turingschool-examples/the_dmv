require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @person_1 = {
      name: 'Bruce',
      age: 18,
      permit: true
    }

    @person_2 = {
      name: 'Penny',
      age: 15
    }

    @registrant_1 = Registrant.new(@person_1[:name], @person_1[:age], @person_1[:permit])
    @registrant_2 = Registrant.new(@person_2[:name], @person_2[:age])
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_a(Registrant)
    end

    it 'can initialize without a permit argument' do
      expect(@registrant_2).to be_a(Registrant)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(@registrant_1.name).to eq(@person_1[:name])
    end

    it 'has a different name' do
      expect(@registrant_2.name).to eq(@person_2[:name])
    end
  end

  describe '#age' do
    it 'has an age' do

    end
  end
end
