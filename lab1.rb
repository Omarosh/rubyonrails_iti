require 'date'

def task1 n, str
  counter = 1
  while counter <= n
    puts str*counter
    counter += 1
  end
end


def task2 str
  puts str.start_with?("if")
end


def task3 str
  temp = str.chr
  str[0] = str[str.length - 1]
  str[str.length - 1] = temp
  puts str
end

def task4 str
  temp = str[str.length - 1]
  puts temp + str + temp
end


def task5(year)
  if Date.leap?(year)
    puts year.to_s + (" is leap year")
  else
    puts year.to_s + (" is not leap year")
  end
end



def task6 arr
  puts arr.rotate(1)
end



def task7 nums
  sum = 0
  flag = false
  nums.each do |n|
    if n == 17
      flag = true
    elsif flag
      flag = false
    else
      sum += n
    end
  end
  puts sum
end



puts "Task1: "
task1(3, "ok")
puts "Task2: "
task2("ifHeisFine")
puts "Task3: "
task3("Python")
puts "Task4: "
task4("hello")
puts "Task5: "
task5(2019)
puts "Task6: "
task6([1,2,3])
puts "Task7: "
task7([3, 5, 1, 17, 2 , 1])


def twoSum(nums, target)
  hash = {}
  nums.each_with_index do |value, i|
    diff = target - value
    if hash[diff]
      return [hash[diff], i]
    else
      hash[value] = i
    end
  end
end
puts "TwoSum: "
puts twoSum([2,7,11,15] , 17)

def balanced? string
  return false if string.length.odd?
  return false if string =~ /[^\[\]\(\)\{\}]/

  pairs = { '{' => '}', '[' => ']', '(' => ')' }

  stack = []
  string.chars do |bracket|
    if pairs[bracket]
      stack << pairs[bracket]
    else
      return false unless stack.pop == bracket
    end
  end

  stack.empty?
end
puts "Balanced Brackets"
puts balanced?("{}{}{")