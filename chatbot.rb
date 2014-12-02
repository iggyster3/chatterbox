require 'colorize'

@load_responses = [] # an empty array accessible to all methods

def get_response(input)
  bot_prompt = "Bot: ".green
  print bot_prompt

  #get reponses and select key that user has typed in
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2, c3: $3, c4: $c4}
end


def save_reponses()
  # open the file for writing
  file = File.open("student_responses.csv", "w")
  # get responses and turn into an array and save in variable
  student_responses = RESPONSES.to_a
  # get new student array converts it to a string and creates new seprator
  response_data = student_responses.join()
  # put new string array into student_reponses.txt file
  file.puts response_data
  # close file
  file.close()
end

def load_students()
  # # open the file for reading
  file = File.open("student_responses.csv", "r")

  file.readlines.each do |line|
      call, response = line.chomp.split(',')
      @load_responses << {:call => call, :response => response}
      puts @load_responses
  end
  file.close
end

# Responses saved in a Hash
RESPONSES = { 'goodbye' => 'bye',
  'sayonara' => 'sayonara',
  'the weather is (.*)' => 'I hate it when it\'s %{c1}',
  'I love (.*)' => 'I love %{c1} too',
  'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
  'my house is (.*)' => 'good your house is %{c1}',
  'I play the (.*) and (.*)' => 'I love the way you play the %{c1} and %{c2}',
  'I brought (.*)' => 'You know I hate %{c1}',
  'I can dance to (.*)' => 'I love the way you dance to %{c1}',
  'I brought my (.*) for (.*)' => 'That\'s a nice %{c1} house for %{c2}',
  'my lucky numbers are (.*), (.*), (.*), (.*)' => 'I did not know your lucky number was %{c1}, %{c2}, %{c3}, %{c4}'}


  person_prompt = "Person: ".red
  bot_prompt = "Bot: ".green

  # load reponses from file
  load_students()

  # Print variable greeting asking for your name
  print bot_prompt, "Hello, what's your name? \n"

  # get name from stdin => keyboard and chop off newline and carriage return
  print person_prompt
  name = gets.chomp


  # Print name variable
  print bot_prompt, "Hello #{name} \n"

  print person_prompt

  def add_new_response(input)
    puts "Want do you want say:"
    call = gets.chomp
    puts "What do you want the response to be:"
    response = gets.chomp

    RESPONSES[call] = response
  end



  # while loop => condition: get stdin put in variable input
  while(input = gets.chomp) do

    if input == 'quit'
      break

    elsif input == 'add new response'
      add_new_response(input)
      puts RESPONSES
    else
      save_reponses()
      puts get_response(input)
    end

    print person_prompt
  end
