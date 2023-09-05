require 'faraday'
require 'json'

class Wave
  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def wave_api
    @wave_api ||= load_data('https://marine-api.open-meteo.com/v1/marine?latitude=34.2783&longitude=-119.2932&hourly=wave_height&daily=wave_height_max,wave_direction_dominant,wave_period_max&timezone=America%2FLos_Angeles&past_days=92')
  end
end