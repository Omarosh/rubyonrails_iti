class User
  @@name = 'User'
  # attr_accessor :name
  def initialize(name)
    @name = name
  end

  def self.name
    @@name
  end

  def self.name=(value)
    @@name = value
  end

  def setName=(value)
    @name = value
  end

  def getName
    @name
  end
end
newuser = User.new("Omar")
puts newuser.getName
puts User.name

class Maths

  def initialize; end

  def self.calc(n1, n2, op)
    flag = false
    if n1.is_a?(Numeric) && n2.is_a?(Numeric)
      if %w[+ - * /].include? op
        flag = true
      else
        puts 'Invalid Operator'
      end
    else
      puts 'Invalid Numbers'
    end
    if flag
      case op
      when '+'
        res = n1 + n2
      when '-'
        res = n1 - n2
      when '*'
        res = n1 * n2
      when '/'
        if n2 == 0
          puts "Division by zero is not allowed"
          flag = false
        else
          res = n1 / n2
        end
      else
        puts 'UnExpected Error'
        flag = false
      end
    end
    if flag
      puts " #{n1} #{op} #{n2} = #{res} "
    end
  end

end

Maths.calc(4,2,"+")
Maths.calc(4,2,"-")
Maths.calc(4,2,"*")
Maths.calc(4,2,"/")



module MyModule
  require 'date'
  class Person
    attr_accessor :fname, :lname, :bdate, :age
    def initialize()
      @fname = ""
      @lname = ""
      @bdate = Date.today
      @age = 0
    end
    def getPersonData
      puts "Enter First Name: "
      @fname = gets.chomp
      puts "Enter Last Name: "
      @lname = gets.chomp
      puts "Enter Birthday (yyyy-mm-dd): "
      @bdate = Date.parse(gets.chomp)
      now = Time.now.utc.to_date
      @age = now.year - @bdate.year - (now.month > @bdate.month || (now.month == @bdate.month && now.day >= @bdate.day) ? 0 : 1)

    end
    def welcome
      puts "Welcome dear #@fname #@lname"
      now = Time.now.utc.to_date
      this_year_birthday = @bdate
      this_year_birthday = Date.parse("#{now.year}-#{@bdate.month}-#{@bdate.day}")
      days = (now - this_year_birthday).to_i
      if days < 0
        days += 365
      end
      months = (days/30).to_i

      puts "Your age is: #@age years, #{months} months and #{days%30} days"
    end

  end
end

person = MyModule::Person.new()
person.getPersonData()
puts person.age
puts person.welcome()

