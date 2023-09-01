require 'dmv_data_service'
require 'vehicle_factory'

class DataQuery
  attr_reader :prompt, :live

  def initialize
    dds = DmvDataService.new
    veh_factory = VehicleFactory.new
    @wa_veh = veh_factory.create_vehicles(dds.wa_ev_registrations)
    @ny_veh = veh_factory.create_vehicles(dds.ny_registrations)
    @prompt = PROMPT
    @live = true
  end

  def query_handler
    while @live do
      puts @prompt
      self.parse_input
    end
  end

  def parse_input
    input = STDIN.gets.chomp

    return self.quit if input == "q:"

    args = input.split(' ').map(&:downcase)
    return bad_input(args[0]) unless args[0].match?(/[1-3]/)
    return bad_input(args[1].upcase) unless args[1].match?(/wa|ny/i)

    case args[0].to_i
    when 1
      self.query_summary(arg[1])
      return true
    when 2
      return true
    when 3
      return true
    else
      return false
    end
  end

  def bad_input(input)
    puts "#{input} is not a valid option; please try again"
    false
  end

  def query_summary(state)

  end

  def quit
    @live = false
    puts "Goodbye"
    nil
  end



  PROMPT = "
  Query WA or NY vehicle registrations: \n
  **Format For Queries: <Opt#> <STATE> <ARGS>**

  1. Summary of WA or NY registrations:
  2. Registered vehicle count for a model year:
  3. Registered vehicle count by engine type (gas, diesel, flex, ev):

  q: (Quit)
  "

end

# dq = DataQuery.new
# dq.parse_input
