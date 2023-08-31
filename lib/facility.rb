class Facility
  attr_reader :name, :address, :phone, :services
  def initialize(args)
    args.each do |k, v|
    instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def add_services(service)
    @services << service
  end
end
