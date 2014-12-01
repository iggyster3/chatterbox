require 'colorize'


def get_response(input)
  bot_prompt = "Bot: ".green
  print bot_prompt

  #get reponses array popoluated with keys and return array of responses
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2, c3: $3, c4: $c4}
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

  # Print variable greeting asking for your name
  print bot_prompt, "Hello, what's your name? \n"

  # get name from stdin => keyboard and chop off newline and carriage return
  print person_prompt
  name = gets.chomp


  # Print name variable
  print bot_prompt, "Hello #{name} \n"

  print person_prompt

  # while loop => condition: get stdin put in variable input
  while(input = gets.chomp) do

    if input == 'quit'
      break
    elsif input == 'add new response'
        puts "Want do you want say:"
        call = gets.chomp
        puts "What do you want the response to be:"
        response = gets.chomp

        RESPONSES[call] = response

        puts RESPONSES
    end

    puts get_response(input)
    print person_prompt
  end
