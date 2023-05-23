require './lib/facility'
require './lib/the_office'
require './lib/dmv_data_service'

RSpec.describe TheOffice do
  describe '#initialize' do
    it 'can initialize' do
      offices = TheOffice.new
      expect(offices).to be_an_instance_of(TheOffice)
    end
  end
end