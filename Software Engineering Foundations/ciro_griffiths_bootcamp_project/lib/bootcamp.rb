class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @students = []
        @teachers = []
        @grades = Hash.new { |h, k| h[k] = [] }
    end
    def name
        @name
    end
    def slogan
        @slogan
    end
    def teachers
        @teachers
    end
    def students
        @students
    end
    def hire(teacher)
        @teachers << teacher
    end
    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        end
        return false
    end
    def enrolled?(student)
        students.include?(student)
    end
    def student_to_teacher_ratio
        @students.length/@teachers.length
    end
    def add_grade(student,grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end
    def num_grades(student)
        @grades[student].length
    end
    def average_grade(student)
        total = 0
        if enrolled?(student) && @grades[student].length > 0
            @grades[student].each do |grade|
                total += grade
            end
        return total/@grades[student].length
        else
            return nil
        end
    end
end
