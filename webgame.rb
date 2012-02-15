require 'sinatra'

before do
  content_type :html
  @defeat={SCISSORS: :PAPER, PAPER: :ROCK, ROCK: :LIZARD, LIZARD: :SPOCK, SPOCK: :SCISSORS, SCISSORS: :LIZARD, LIZARD: :PAPER, PAPER: :SPOCK, SPOCK: :ROCK, ROCK: :SCISSORS}
  @throws=@defeat.keys
  @wins =0
  @losses=0
  @tie=0
  @result=""
end

get '/' do
  erb :homepage
end


get '/throw' do
  erb :instruction
end
post '/throw' do
   erb :instruction
end

get '/throw/'do
   erb:play
end

post '/throw/' do
	

   @player_throw=params[:selected_value].to_sym
  @computer_throw=@throws.sample
  if @player_throw==@computer_throw
   @result="TIE"

  elsif @computer_throw == @defeat[@player_throw]
    @result="WON"

  else @player_throw == @defeat[@computer_throw]
    @result="LOST"

  end
    erb :stats
 
end


  get '/stats' do
 	@wins=params[:wins]
	@losses=params[:losses]
	@tie=params[:ties]
    erb :gamepage
  end

	

  post '/stats' do
	
	@wins=params[:wins].to_i
	@losses=params[:losses].to_i
	@tie=params[:ties].to_i

  @player_throw=params[:selected_value].to_sym
  @computer_throw=@throws.sample
  if @player_throw==@computer_throw
   @result="TIE"

  elsif @computer_throw == @defeat[@player_throw]
    @result="WON"

  else @player_throw == @defeat[@computer_throw]
    @result="LOST"

  end	
	

	if @result=="WON"
	@wins =@wins + 1
	
	elsif @result == "LOST"
	@losses =@losses + 1
	
	else @result == "TIE"
	@tie = @tie + 1
	end

	erb :stats
  
  end
  

 

