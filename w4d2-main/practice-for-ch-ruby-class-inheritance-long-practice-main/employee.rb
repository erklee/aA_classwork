class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @boss.add_employee(self) if @boss.is_a?(Manager)
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end


class Manager < Employee

    attr_accessor :employees

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(employee)
        @employees << employee unless employees.include?(employee)
    end

    def bonus(multiplier)
        total_subordinate_salary * multiplier
    end

    protected

    def total_subordinate_salary
        total_salary = 0
   
        @employees.each do |employee|
          total_salary += employee.salary
          total_salary += employee.total_subordinate_salary if employee.is_a?(Manager)
        end
        total_salary
      end
end


ned = Manager.new('Ned', 'Founder', 1_000_000)
darren = Manager.new('Darren', 'TA Manager', 78_000, ned)
shawna = Employee.new('Shawna', 'TA', 12_000, darren)
david = Employee.new('David', 'TA', 10_000, darren)


puts ned.bonus(5)
puts darren.bonus(4)
puts shawna.bonus(3)
puts david.bonus(3)






