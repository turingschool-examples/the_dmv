class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = vehicle_details[:registration_date]
    @plate_type = vehicle_details[:plate_type]
  end

  
  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registration_date(date = nil)
      return nil if date.nil?
      
      formatted_date = DateTime.parse(date).strftime('%Y-%m-%d')
      @registration_date = formatted_date
  rescue ArgumentError
      puts "Invalid date format. Please provide a valid date."
  end 

  # def << (formatted_date)
  #   registration_date(date = nil)
  # end

  def plate_type
    if antique?
      :antique
    elsif electric_vehicle?
      :ev
    else
      :regular
    end
  end

end

