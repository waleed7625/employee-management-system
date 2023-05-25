class Employee
    attr_reader :name, :age, :salary
    
    def initialize(name, age, salary)
      @name = name 
      @age = age
      @salary = salary
    end
  end
  
  class EmployeeManagementSystem
    def initialize
      @employees = []
    end
  
    def add_new_employee(employee)
      new_employee = { name: employee.name, age: employee.age, salary: employee.salary }
      @employees << new_employee
      
      if @employees.include?(new_employee)
        puts "Employee with name #{employee.name} has been added"
      end
    end
  
    def find_employee(search_value)
      found_employee = @employees.find { |employee| employee[:name] == search_value || employee[:age] == search_value }
      
      if found_employee
        puts "Name: #{found_employee[:name]}, Age: #{found_employee[:age]}, Salary: #{found_employee[:salary]}"
      else
        puts "Employee not found."
      end
    end
  
    def avg_salary
      total_salary = @employees.sum { |employee| employee[:salary] }
      average_salary = total_salary / @employees.length
      
      puts "Average salary: #{average_salary}"
    end
  
    def raise_salary(percent)
      @employees.each do |employee|
        previous_salary = employee[:salary]
        employee[:salary] += (percent * employee[:salary] / 100)  
        puts "#{employee[:name]}'s salary was #{previous_salary} and is now #{employee[:salary]} after a #{percent}% increment."
      end
    end
  end
  
  # Usage example:
#   smith = Employee.new("Smith", "25", 40000)
#   john = Employee.new("John", "30", 20000)
#   ems = EmployeeManagementSystem.new
#   ems.add_new_employee(smith)
#   ems.add_new_employee(john)
#   ems.find_employee("30")
#   ems.avg_salary
#   ems.raise_salary(50)