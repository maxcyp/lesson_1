=begin
 

 Display menu
 ask for the two numbers to calculate
 what do we want to do? +, - , *, /

  
=end
def calculate(x, y, multi)
  if multi == '+'
    return x+y
  elsif multi == '-'
    return x-y
  elsif multi == '/'
    return (x.to_f/y.to_f)
  elsif multi == '*'
    return x*y
  else
    return nil
  end  
end
  
begin
  system 'clear'
  puts "Please enter first number: "
  number1 = gets.chomp.to_i
  puts "+,-,*,/,exit: "
  multi = gets.chomp
  puts "Please enter second number: "
  number2 = gets.chomp.to_i

  exit = calculate(number1, number2, multi)

  if exit
    puts "Answer: #{exit.to_s}"
  end


end until !exit
