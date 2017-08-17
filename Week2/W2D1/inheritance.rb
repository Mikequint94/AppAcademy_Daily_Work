class Employee

  attr_accessor :salary

  def initialize(salary = 12_000)
    @salary = salary
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :employees

  def initialize(salary = 78_000)
    super
    @employees = []
  end

  def bonus(multiplier)
    employees.map(&:salary).reduce(:+) * multiplier
  end

end

joe = Employee.new
mike = Manager.new(1_000_000)

mike.employees << joe

puts joe.bonus(1)
puts mike.bonus(10)
