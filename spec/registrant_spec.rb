require 'pry'
require './lib/registrant'
require 'rspec'

describe Registrant do
  before :each do
    @registrant = Registrant.new(@name, @age)
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
 
  end
end

end