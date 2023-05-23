class Office

  def create_offices(data)
    data.map do |office_data|
      Facility.new(office_data)  
    end
    require 'pry'; binding.pry
  end
end