require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            true
        else
            false
        end
    end

    def >(other_startup)
        if self.funding > other_startup.funding
            true
        else
            false
        end
    end

    def hire(employee_name,title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        money_owed = @salaries[employee.title]
        if @funding > money_owed
            employee.pay(money_owed)
            @funding -= money_owed
        else
            raise "not enough funding to pay employee"
        end
    end

    def payday
        @employees.each do |worker|
            pay_employee(worker)
        end
    end

    def average_salary
        total = 0
        @employees.each do |employee|
            total += @salaries[employee.title]
        end
        total/@employees.length
    end 

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |title,salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        other_startup.employees.each do |worker|
            @employees << worker
        end
        other_startup.close
    end
end
