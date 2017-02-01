require 'pry'
require 'yaml'

# for multiple langs
# language = extract system language
# filename = calculator-message + -language + .yaml
# MESSAGES = YAML.load_file(filename)

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number(num)
  /^[-+]?[0-9]*\.?[0-9]+$/.match(num) #from googline "regex match float"
  #solution to challenge 2: num.to_f.to_s.to_f == num.to_f # originally would not let user = 0
end

def operation_to_message(op)
  funny_stuff_right_here = case op
  when "1" then MESSAGES["adding"]
  when "2" then MESSAGES["subtracting"]
  when "3" then MESSAGES["multiplying"]
  when "4" then MESSAGES["dividing"]
  end
  
  funny_stuff_right_here
end

prompt MESSAGES['welcome']

name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt MESSAGES['valid_name']
  else
    break
  end
end

filename = "names.txt"
File.open(filename, 'a') do |file|
  file.puts name
end
prompt "#{MESSAGES["name_saved"]} #{name.upcase}."

loop do # main loop
  number1 = ""
  loop do
    prompt MESSAGES["number1"]
    number1 = gets.chomp
    if valid_number(number1)
      break
    else
      prompt MESSAGES["num_error"]
    end
  end
  
  number2 = ""
  loop do
    prompt MESSAGES["number2"]
    number2 = gets.chomp
    if valid_number(number2)
      break
    else
       prompt MESSAGES["num_error"]
    end
  end
  
  operator_prompt = <<-MSG
    #{MESSAGES["operator_prompt"]}
  MSG


  operator_prompt = MESSAGES["operator_prompt"]
  
  prompt operator_prompt
  
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator) # remember %w is an array of strings
      break
    else
      prompt "#{MESSAGES[op_error1]} #{name}." 
      prompt MESSAGES[op_error2]
    end
  end
  
  prompt "#{operation_to_message(operator)} #{number1} #{MESSAGES["with"]} #{number2} #{MESSAGES["math_is_hard"]}"
  3.times do
    sleep 0.2
    puts "."
    5.times do
      sleep 0.2
      print "."
    end
  end
  
  case operator
  when '1'
    result = number1.to_f + number2.to_f
  when '2'
    result = number1.to_f - number2.to_f
  when '3'
    result = number1.to_f * number2.to_f
  when '4'
    result = number1.to_f / number2.to_f
  end
  puts "#{MESSAGES["got_it"]} #{result}!"

  prompt MESSAGES["exit?"]
  answer = gets.chomp
  break if answer.upcase.start_with?("Y")
end

prompt MESSAGES["exiting"]
