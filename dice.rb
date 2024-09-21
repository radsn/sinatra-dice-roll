require "sinatra"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get '/' do
  "Hello World"
  erb(:elephant)
  # "<h1>2d6</h1>
  # <ul>
  #   <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
  #   <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
  #   <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
  #   <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  # </ul>"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
  #outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  # "<h1>2d6</h1>
  #  <p>#{outcome}</p>"
  erb(:two_six, {:layout => :wrapper})
end 


get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  	
  # "<h1>2d10</h1>
  #  <p>#{outcome}</p>"
  erb(:two_ten, {:layout => :wrapper})
end 


get("/dice/1/20") do
  @first_die = rand(1..20)
  @outcome = "You rolled a #{first_die}."
  	
  # "<h1>1d20</h1>
  #  <p>#{outcome}</p>"
  erb(:one_twenty, {:layout => :wrapper})
end 


get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
  @outcome = "You rolled a #{first_die} and a #{second_die} and a #{third_die} and a #{fourth_die} and a #{fifth_die} for a total of #{sum}."
  	
  # "<h1>5d4</h1>
  #  <p>#{outcome}</p>"
   erb(:five_four, {:layout => :wrapper})
end 


get("/dice/100/6") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number
    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_hundred_six, {:layout => :wrapper})
end
