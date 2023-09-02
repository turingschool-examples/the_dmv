require_relative 'dmv_data_service'
require_relative 'vehicle_factory'

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

    self.print_query_header

    args = input.split(' ').map(&:downcase)
    return bad_input(args[0]) unless args[0].match?(/[1-3]/)
    return bad_input(args[1].upcase) unless args[1].match?(/wa|ny/i)

    case args[0].to_i
    when 1
      return self.query_summary(args[1])
    when 2
      return self.query_year(args[1], args[2])
    when 3
      return bad_input(args[1].downcase) unless args[2].match?(/gas|diesel|ev|flex/i)
      return self.query_engine(args[1], args[2])
    else
      return false
    end
  end

  def bad_input(input)
    puts "#{input} is not a valid option; please try again"
    self.print_query_header
    return false
  end

  def print_query_header
    puts "*" * 16, "Query Results".center(16), "*" * 16
  end

  def query_engine(state, engine)
    registrations = state_helper(state)

    filtered = registrations.filter { |v| v.engine == engine.to_sym}
    puts "\t- There are #{filtered.count} registered cars with a #{engine} engine in #{state.upcase}"
    self.print_query_header
    return true
  end

  def query_year(state, year)
    registrations = state_helper(state)

    filtered = registrations.filter { |v| v.year == year}
    puts "\t- There are #{filtered.count} registered cars for the year #{year} in #{state.upcase}"
    self.print_query_header
    return true
  end

  def query_summary(state)
    registrations = state_helper(state)


    puts "Here's a short summary of vehicle registration data for #{state.upcase}"
    # most popular
    max_make_model = registrations.map { |v| "#{v.make} #{v.model}" } # => array of make+model
                                  .reduce(Hash.new(0)) { |h, mm| h[mm] += 1; h } # => hash of make+model, values
                                  .max_by { |mm, count| count } # => array of key, value
    puts "\t- The most popular car is the #{max_make_model[0].rstrip} @ #{max_make_model[1]} registrations"
    # oldest car
    oldest_car = registrations.min_by { |v| v.year }
    puts "\t- The oldest car is a #{oldest_car.make}: #{oldest_car.year}"
    # county with most veh
    most_county = registrations.map { |v| v.county }
                               .reduce(Hash.new(0)) { |h, cnty| h[cnty] += 1; h }
                               .max_by { |cnty, count| count}
    puts "\t- The county with the most registered vehicles is #{most_county[0].capitalize} @ #{most_county[1]}"
    self.print_query_header
    return true
  end

  def quit
    @live = false
    puts "Goodbye"
    nil
  end

  def state_helper(state)
    state == 'wa' ? @wa_veh : @ny_veh
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

# Uncomment following lines to run via ruby command
# dq = DataQuery.new
# dq.query_handler
