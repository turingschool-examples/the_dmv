class Dmv

attr_reader :name, :address, :phone, 
            :facilities 
  def initialize
    @name = name
    @address = address
    @phone = phone
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    selected_facility = []
    @facilities.each do |facility|
     if facility.services.include?(service)
        selected_facility.push(facility)
      end
    end   
    selected_facility
  end
end
