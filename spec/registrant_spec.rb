require './lib/registrant'

RSpec.describe Registrant do
  describe "#initialize" do
    it "exists" do
      registrant_1 = Registrant.new("Bruce", 18, true)
    end
  end
end