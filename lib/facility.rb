class Facility
  attr_reader :name, :address, :phone, :services
  def initialize(args)
    args.each do |k, v|
    instance_variable_set("@#{k}", v) unless v.nil?
    end
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
