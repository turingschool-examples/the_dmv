class Registrant

  attr_reader :name, 
              :age,
              :permit
  def initialize(data)
      @name = data[:name]
      @age = data[:age]
      @permit = data[:permit]
  end
end