require 'spec_helper'

RSpec.configure do |config|
      config.formatter = :documentation
end

RSpec.describe Dmv do
  before(:each) do
    @dmv = Dmv.new
    @registrant_1 = Registrant.new({name: 'Bruce', age: 18, permit: true})
    @registrant_2 = Registrant.new({name: 'Penny', age: 15})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit).to eq(true)
      expect(@registrant_1.license_data).to eq({written: false, license: false, renewed: false})

    end
  end
  
end
