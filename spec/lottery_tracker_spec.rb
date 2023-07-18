require './lib/lottery_data_service'
require './lib/lottery_tracker'

RSpec.describe LotteryTracker do
  describe "#initialize" do
    it "exists" do
      tracker = LotteryTracker.new

      expect(tracker).to be_a LotteryTracker
    end
  end
end