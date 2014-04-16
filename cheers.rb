puts "What's your name?"
name = gets.upcase.strip
if name.length == 0
  raise NameError, "This app only had one step and you failed"
end
an_array = ["A","E","I","O","U"]
name.each_char do |character|
  if character != " "
    if an_array.include?(character)
      puts "Give me an... " + character
    else character[/\w/]
      puts "Give me a... " + character
    end
  end
end
puts "#{name}'s just Grand!"
