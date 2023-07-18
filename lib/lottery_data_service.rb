require 'faraday'
require 'json'

class LotteryDataService
  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def ny_lottery_data
    @ny_lottery_data ||= load_data('https://data.ny.gov/resource/d6yy-54nr.json')
  end
end